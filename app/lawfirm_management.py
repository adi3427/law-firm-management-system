import tkinter as tk
from tkinter import messagebox
import cx_Oracle

# Database Connection (Update this with your credentials)
def db_connect():
    try:
        conn = cx_Oracle.connect('SYSTEM/HIhello@localhost:1521/XE')  # Update with your details
        return conn
    except cx_Oracle.DatabaseError as e:
        messagebox.showerror("Database Error", f"Error: {str(e)}")
        return None

# Login function
def login():
    username = entry_username.get()
    password = entry_password.get()

    if username == 'admin' and password == 'admin':  # Default login credentials
        root.destroy()  # Close login window
        open_dashboard()  # Open dashboard
    else:
        messagebox.showerror("Invalid Login", "Incorrect username or password.")

# Dashboard Function
def open_dashboard():
    dashboard = tk.Tk()
    dashboard.title("Law Firm Management System")

    # Dashboard buttons to manage Lawyers, Clients, and Cases
    btn_manage_lawyers = tk.Button(dashboard, text="Manage Lawyers", command=lambda: manage_lawyers(dashboard))
    btn_manage_lawyers.pack(pady=10)

    btn_manage_clients = tk.Button(dashboard, text="Manage Clients", command=lambda: manage_clients(dashboard))
    btn_manage_clients.pack(pady=10)

    btn_manage_cases = tk.Button(dashboard, text="Manage Cases", command=lambda: manage_cases(dashboard))
    btn_manage_cases.pack(pady=10)

    dashboard.mainloop()

# Manage Lawyers Function
def manage_lawyers(dashboard):
    manage_window(dashboard, "Lawyers", ["LawyerID", "Name", "Specialization", "YearsOfExperience", "ContactInfo"])

# Manage Clients Function
def manage_clients(dashboard):
    manage_window(dashboard, "Clients", ["ClientID", "Name", "Address", "ContactInfo"])

# Manage Cases Function
def manage_cases(dashboard):
    manage_window(dashboard, "Cases", ["CaseNumber", "Type", "FilingDate", "Status", "ClientID", "LawyerID"])

# Generic Function to Manage Tables (Lawyers, Clients, Cases)
def manage_window(dashboard, table, columns):
    manage_win = tk.Toplevel(dashboard)
    manage_win.title(f"Manage {table}")

    tk.Label(manage_win, text=f"Manage {table}", font=("Arial", 14)).pack(pady=10)

    # Display data from the table
    conn = db_connect()
    if conn:
        cursor = conn.cursor()
        cursor.execute(f"SELECT * FROM {table}")
        records = cursor.fetchall()

        for record in records:
            tk.Label(manage_win, text=str(record)).pack()

    # Form to add a new record
    form_frame = tk.Frame(manage_win)
    form_frame.pack(pady=10)
    
    entry_fields = {}
    for col in columns:
        tk.Label(form_frame, text=col).grid(row=columns.index(col), column=0, padx=10, pady=5)
        entry = tk.Entry(form_frame)
        entry.grid(row=columns.index(col), column=1, padx=10, pady=5)
        entry_fields[col] = entry

    # Add button to insert a new record
    def add_record():
        values = [entry_fields[col].get() for col in columns]
        conn = db_connect()
        if conn:
            cursor = conn.cursor()
            cursor.execute(f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({', '.join([':' + str(i + 1) for i in range(len(values))])})", tuple(values))
            conn.commit()
            messagebox.showinfo("Success", f"Record added to {table}")
            manage_win.destroy()
            manage_window(dashboard, table, columns)  # Refresh the window

    add_button = tk.Button(manage_win, text="Add Record", command=add_record)
    add_button.pack(pady=10)

    # Update/Delete options
    tk.Label(manage_win, text="Enter the ID to update or delete:").pack(pady=10)

    id_entry = tk.Entry(manage_win)
    id_entry.pack(pady=5)

    def update_record():
        record_id = id_entry.get()
        new_values = {col: entry_fields[col].get() for col in columns}
        conn = db_connect()
        if conn:
            cursor = conn.cursor()
            set_clause = ', '.join([f"{col} = :{col}" for col in columns[1:]])  # Skip the ID for updating
            cursor.execute(f"UPDATE {table} SET {set_clause} WHERE {columns[0]} = :id", {**new_values, "id": record_id})
            conn.commit()
            messagebox.showinfo("Success", f"Record updated in {table}")
            manage_win.destroy()
            manage_window(dashboard, table, columns)

    update_button = tk.Button(manage_win, text="Update Record", command=update_record)
    update_button.pack(pady=5)

    def delete_record():
        record_id = id_entry.get()
        conn = db_connect()
        if conn:
            cursor = conn.cursor()
            cursor.execute(f"DELETE FROM {table} WHERE {columns[0]} = :id", {"id": record_id})
            conn.commit()
            messagebox.showinfo("Success", f"Record deleted from {table}")
            manage_win.destroy()
            manage_window(dashboard, table, columns)

    delete_button = tk.Button(manage_win, text="Delete Record", command=delete_record)
    delete_button.pack(pady=10)

# Login page UI
root = tk.Tk()
root.title("Login")

tk.Label(root, text="Username:").pack(pady=10)
entry_username = tk.Entry(root)
entry_username.pack(pady=5)

tk.Label(root, text="Password:").pack(pady=10)
entry_password = tk.Entry(root, show="*")
entry_password.pack(pady=5)

login_button = tk.Button(root, text="Login", command=login)
login_button.pack(pady=20)

root.mainloop()
