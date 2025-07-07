# Law Firm Management System

A comprehensive law firm management system with database backend and Python GUI interface.

## Features

- **User Authentication**: Secure login system for administrators
- **Entity Management**: CRUD operations for:
  - Lawyers
  - Clients
  - Cases
  - Hearings
  - Invoices
- **Database Triggers**:
  - Automatic invoice generation when cases are closed
  - Change tracking for lawyers, clients, cases, and hearings
  - Access control for case updates
- **Stored Procedures**: Client case and invoice viewing procedure

## Database Schema

The system uses Oracle Database with the following tables:

- **LawFirms**: Law firm information
- **Lawyers**: Attorney details and specializations
- **Clients**: Client contact information
- **Cases**: Legal case details and status
- **Courts**: Court information
- **Hearings**: Scheduled court appearances
- **Invoices**: Billing information
- **History Tables**: Track changes to key entities

## Prerequisites

- Oracle Database (tested with XE)
- Python 3.x
- Required Python packages:
  - tkinter
  - cx_Oracle
