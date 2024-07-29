DO $$ 
BEGIN
    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'salaries') THEN
        DROP TABLE salaries;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dept_manager') THEN
        DROP TABLE dept_manager;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'dept_emp') THEN
        DROP TABLE dept_emp;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'departments') THEN
        DROP TABLE departments;
    END IF;

    IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'employees') THEN
        DROP TABLE employees;
    END IF;

	IF EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'titles') THEN
        DROP TABLE titles;
    END IF;
END $$;

CREATE TABLE departments (
  dept_no VARCHAR(4) NOT NULL PRIMARY KEY,
  dept_name VARCHAR(40) NOT NULL
);

CREATE TABLE titles (
  title_id VARCHAR(10) NOT NULL PRIMARY KEY,
  title VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
  emp_no INT NOT NULL PRIMARY KEY,
  emp_title_id VARCHAR(10) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex CHAR(1),
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(4) NOT NULL,
  PRIMARY KEY (emp_no, dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE dept_manager (
  dept_no VARCHAR(4) NOT NULL,
  emp_no INT NOT NULL,
  PRIMARY KEY (dept_no, emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL PRIMARY KEY,
  salary INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

