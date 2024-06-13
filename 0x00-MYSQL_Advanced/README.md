```
-- Advanced SQL Topics

-- Views
CREATE VIEW employee_info AS
SELECT e.employee_id, e.first_name, e.last_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;

-- Triggers
CREATE TRIGGER update_salary
BEFORE UPDATE OF salary ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Salary cannot be negative');
    END IF;
END;

-- Procedures
CREATE PROCEDURE get_employee_info(p_employee_id IN NUMBER)
AS
    v_first_name VARCHAR2(50);
    v_last_name VARCHAR2(50);
BEGIN
    SELECT first_name, last_name
    INTO v_first_name, v_last_name
    FROM employees
    WHERE employee_id = p_employee_id;
    
    DBMS_OUTPUT.PUT_LINE('Employee Name: '| v_first_name || ' || v_last_name);
END;

-- Example usage of the procedure
BEGIN
    get_employee_info(123);
END;

-- Stored Functions
CREATE FUNCTION get_department_name(p_department_id IN NUMBER)
RETURN VARCHAR2
AS
    v_department_name VARCHAR2(50);
BEGIN
    SELECT department_name
    INTO v_department_name
    FROM departments
    WHERE department_id = p_department_id;
    
    RETURN v_department_name;
END;

-- Example usage of the function
SELECT get_department_name(10) FROM dual;

-- Indexes
CREATE INDEX idx_employee_last_name ON employees(last_name);

-- Constraints
CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Window Functions
SELECT order_id, order_date, 
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders;

-- Common Table Expressions (CTEs)
WITH sales AS (
    SELECT product_id, SUM(quantity) AS total_sales
    FROM order_items
    GROUP BY product_id
)
SELECT p.product_name, s.total_sales
FROM products p
JOIN sales s ON p.product_id = s.product_id
ORDER BY s