# SAP ABAP Delivery Report

## 📌 Project Overview

**Delivery Report** is an SAP ABAP reporting project developed using **SAP GUI**.

The report retrieves delivery-related information by combining data from the SAP standard tables **LIKP** (Delivery Header) and **LIPS** (Delivery Item). The retrieved data is displayed in an interactive **SALV ALV report**.

The report allows users to filter delivery data based on:

* Delivery Number
* Delivery Date
* Customer

The final ALV output displays:

* Delivery No
* Delivery Date
* Customer
* Material
* Quantity
* Plant

---

## 🎯 Project Objective

The main objective of this project is to develop an SAP ABAP report that provides a simple and structured view of delivery information.

The project demonstrates how ABAP can be used to:

1. Create a selection screen.
2. Retrieve data from SAP standard tables.
3. Join header and item data using Open SQL.
4. Store retrieved data in an internal table.
5. Display the result using SALV ALV.
6. Customize the ALV column headings.

---

## 🏗️ Project Architecture

```text
                 LIKP
          Delivery Header Table
                 │
        ┌────────┼─────────┐
        │        │         │
      VBELN     WADAT     KUNNR
        │        │         │
        └────────┼─────────┘
                 │
                 │ VBELN
                 │
                 ▼
                 LIPS
          Delivery Item Table
                 │
        ┌────────┼─────────┐
        │        │         │
      MATNR     LFIMG     WERKS
        │        │         │
        └────────┼─────────┘
                 │
                 ▼
           INNER JOIN
                 │
                 ▼
        ZDELIVERY_REPORT
                 │
                 ▼
             SALV ALV
                 │
                 ▼
          Delivery Report
```

---

## 🗄️ SAP Tables Used

### 1. LIKP – Delivery Header

LIKP contains the header-level information of a delivery.

| Report Field  | SAP Table | SAP Field | Description                 |
| ------------- | --------- | --------- | --------------------------- |
| Delivery No   | LIKP      | VBELN     | Delivery Number             |
| Delivery Date | LIKP      | WADAT     | Planned Goods Movement Date |
| Customer      | LIKP      | KUNNR     | Ship-to Party / Customer    |

> **Note:** `WADAT` is the technical SAP field used for the delivery date in this project. The ALV output heading is displayed as **Delivery Date**.

### 2. LIPS – Delivery Item

LIPS contains item-level information for a delivery.

| Report Field | SAP Table | SAP Field | Description               |
| ------------ | --------- | --------- | ------------------------- |
| Material     | LIPS      | MATNR     | Material Number           |
| Quantity     | LIPS      | LFIMG     | Actual Quantity Delivered |
| Plant        | LIPS      | WERKS     | Plant                     |

---

## 🔗 Table Relationship

The LIKP and LIPS tables are connected using the **Delivery Number (`VBELN`)**.

```text
LIKP-VBELN
     =
LIPS-VBELN
```

The report uses an **INNER JOIN** to retrieve the required header and item information together.

---

## 🔎 Selection Screen

The report provides the following selection criteria:

```text
Delivery Number
Delivery Date
Customer
```

Users can enter one or more values or ranges to filter the delivery information.

Example:

```text
Delivery Number : 80000001
Delivery Date   : 18.09.2026
Customer        : 10000001
```

---

## 📊 ALV Output

The report displays the retrieved information using **SALV ALV**.

Example output:

| Delivery No | Delivery Date | Customer | Material | Quantity | Plant |
| ----------- | ------------- | -------- | -------- | -------: | ----- |
| 80000001    | 18.09.2026    | 10000001 | 17100001 |    20000 | TG11  |
| 80000001    | 18.09.2026    | 10000001 | 17100002 |     9000 | TG11  |
| 80000002    | 19.09.2026    | 10000002 | 17100003 |     5000 | TG12  |

*The values above are sample data for demonstration.*

---

## 🛠️ Technologies Used

* **SAP ABAP**
* **SAP GUI**
* **Open SQL**
* **INNER JOIN**
* **Internal Tables**
* **Selection Screen**
* **SALV ALV**
* **SAP Standard Tables**

  * LIKP
  * LIPS

---

## 📚 ABAP Concepts Demonstrated

This project demonstrates the following ABAP concepts:

### 1. Selection Screen

Used `SELECT-OPTIONS` to allow users to enter filtering conditions.

### 2. Open SQL

Used Open SQL to retrieve data from SAP database tables.

### 3. INNER JOIN

Combined delivery header information from LIKP with delivery item information from LIPS.

### 4. Internal Table

Stored the selected data temporarily before displaying it.

### 5. Structure

Created a custom ABAP structure containing the fields required for the report.

### 6. SALV ALV

Used `CL_SALV_TABLE` to display the report in an ALV format.

### 7. ALV Column Customization

Customized the displayed column headings, including displaying:

```text
WADAT → Delivery Date
```

instead of the standard SAP field description.

---

## 📁 Repository Structure

```text
ZDELIVERY_REPORT/
│
├── README.md
│
├── src/
│   └── ZDELIVERY_REPORT.abap
│
└── screenshots/
    └── delivery_report_alv.png
```

---

## 🚀 How to Run the Project

1. Open **SAP GUI**.
2. Go to transaction **SE38**.
3. Create/open the ABAP program:

```text
ZDELIVERY_REPORT
```

4. Paste the ABAP source code.
5. Activate the program.
6. Execute the program using **F8**.
7. Enter the required selection criteria.
8. Execute the selection.
9. The delivery data will be displayed in **SALV ALV** format.

---

## 💡 Key Learning

Through this project, I learned how to:

* Work with SAP standard database tables.
* Understand header and item table relationships.
* Use Open SQL for database retrieval.
* Perform INNER JOIN operations in ABAP.
* Work with internal tables and structures.
* Create selection screens.
* Develop ALV reports using SALV.
* Customize ALV output headings.

---

## 📸 Project Screenshots

### Selection Screen

Add your SAP GUI selection-screen screenshot here.

```text
screenshots/selection_screen.png
```

### ALV Output

Add your final ALV screenshot here.

```text
screenshots/delivery_report_alv.png
```

---

## 👩‍💻 Author

**Nandini Pamisetty**

B.Tech – Computer Science and Engineering

Interested in **Software Development and SAP ABAP**.

---

## 📌 Project Status

**Completed**

This project was developed as a learning and portfolio project to understand SAP ABAP reporting, Open SQL, table joins, and ALV reporting.
