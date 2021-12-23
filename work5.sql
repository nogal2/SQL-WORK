-- ����1) EMPLOYEES ���̺��� Kochhar�� �޿����� ���� ����� ������ �����ȣ,�̸�,������,�޿��� ����϶�.
SELECT b.employee_id, b.first_name, b.job_id, b.salary
FROM employees a, employees b
WHERE a.last_name = 'Kochhar'
    AND a.salary < b.salary;

-- ����2) EMPLOYEES ���̺��� �޿��� ��պ��� ���� ����� ������ 
-- �����ȣ,�̸�,������,�޿�,�μ���ȣ�� ����Ͽ���.  
SELECT employee_id, first_name, job_id, department_id
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);



-- ����3) EMPLOYEES ���̺��� 100�� �μ��� �ּ� �޿����� �ּ� �޿��� ���� �ٸ� ��� �μ��� ����϶�
SELECT department_id, MIN(salary)
FROM employees 
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                        FROM employees
                        WHERE department_id = 100);
                        
-- ����4) �������� �ּ� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�μ���ȣ�� ����Ͽ���. 
-- �� �������� �����Ͽ���.
SELECT employee_id, first_name, job_id, department_id
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, MIN(salary)
                        FROM employees
                        GROUP BY job_id)
ORDER BY job_id;


-- ����5) EMPLOYEES �� DEPARTMENTS ���̺��� ������ SA_MAN ����� ������ �̸�,����,�μ���,�ٹ����� ����϶�.
-- FROM, WHERE�� �� �� �ۼ� 
SELECT e.first_name, e.job_id, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id
    AND e.job_id = 'SA_MAN';


-- ����6) EMPLOYEES ���̺��� ���� ���� ����� ���� MANAGER�� �����ȣ�� ����϶�.
SELECT manager_id as �����ȣ
FROM 
(SELECT manager_id, COUNT(*), rank () over(ORDER BY COUNT(*) DESC) AS RNUM
FROM employees
GROUP BY manager_id)
WHERE RNUM = 1;

-- ����7) EMPLOYEES ���̺��� ���� ���� ����� ���� �ִ� �μ� ��ȣ�� �������  ����϶�.
SELECT department_id, "�����"
FROM
(SELECT department_id, COUNT(*) AS "�����", RANK () OVER(ORDER BY COUNT(*) DESC) AS RNUM
FROM employees
GROUP BY department_id);


-- ����8) EMPLOYEES ���̺��� �����ȣ�� 123�� ����� ������ ���� 
--                           �����ȣ�� 192�� ����� �޿�(SAL)���� ���� ����� �����ȣ,�̸�,����,�޿��� ����϶�.

SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE job_id IN (SELECT job_id
                 FROM employees
                 WHERE employee_id = 123)
AND
salary
>(SELECT salary
FROM employees
WHERE employee_id = 192);

-- ����9)����(JOB)���� �ּұ޿��� �޴� ����� ������ �����ȣ,�̸�,����,�μ����� ����϶�.
-- ����1 :�������� ������������
SELECT e.employee_id, e.first_name, e.job_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND(job_id, salary) IN (SELECT job_id, MIN(salary)
                            FROM employees
                            GROUP BY job_id)
    ORDER BY job_id DESC;


-- ����10) EMPLOYEES ���̺��� (50�� �μ��� �ּ� �޿�)�� �޴� ������� ���� �޿��� �޴� 
-- ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. 
-- �� 50���� ����
SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50) 
AND department_id != 50;

-- ����11) EMPLOYEES ���̺��� 50�� �μ��� �ְ� �޿��� �޴� ��� ���� ���� �޿��� �޴� ����� ������ �����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. 
-- ��50���� ����
SELECT employee_id, first_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 50) 
AND department_id != 50

