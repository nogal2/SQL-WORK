-- ����1) EMPLOYEES ���̺��� �޿��� 3000�̻��� ����� �����ȣ, �̸�, ������, �޿��� ����϶�.
SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE salary >= 3000;

-- ����2) EMPLOYEES ���̺��� ��� ������ ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, last_name, job_id, salary, department_id
FROM employees
WHERE job_id = 'ST_MAN';

-- ����3) EMPLOYEES ���̺��� �Ի����ڰ� 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� ������ 
-- �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date > '2006/01/01';

-- ����4) EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ����� ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT first_name, last_name, job_id, salary, department_id 
FROM employees
WHERE (salary >= 3000) AND (salary <= 5000);
--WHERE salary BETWEEN 3000 AND 5000;

-- ����5) EMPLOYEES ���̺��� �����ȣ�� 145,152,203�� ����� ������ �����ȣ, ����, ������, �޿�, �Ի����ڸ� ����϶�
SELECT employee_id, first_name, last_name, job_id, salary, hire_date
FROM employees
WHERE employee_id IN(145,152,203);

-- ����6) EMPLOYEES ���̺��� �Ի����ڰ� 05�⵵�� �Ի��� ����� ������ �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date LIKE '05%';

-- ����7) EMPLOYEES ���̺��� ���ʽ��� ���� ����� �����ȣ, ����, ������, �޿�, �Ի�����, ���ʽ�, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, last_name, job_id, salary * NVL(commission_pct, 0), hire_date, department_id
FROM employees
WHERE commission_pct IS NULL OR commission_pct = '0';

-- ����8) EMPLOYEES ���̺��� �޿��� 1100�̻��̰� JOB�� ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT employee_id, first_name, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE (salary >= 1100) AND job_id = 'ST_MAN';

-- ����9) EMPLOYEES ���̺��� �޿��� 10000�̻��̰ų� JOB�� ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT employee_id, first_name, last_name, job_id, salary, hire_date, department_id
FROM employees
WHERE (salary >= 10000) OR (job_id = 'ST_MAN');

-- ����10) EMPLOYEES ���̺��� JOB�� ST_MAN, SA_MAN, SA_REP�� �ƴ� ����� �����ȣ, ����, ������, �޿�, �μ���ȣ�� ����϶�
SELECT employee_id, first_name, last_name, job_id, salary, department_id
FROM employees
WHERE job_id != ALL('ST_MAN', 'SA_MAN', 'SA_REP');

-- ����11) ������ PRES�̰� �޿��� 12000�̻��̰ų� ������ SA_MAN�� ����� �����ȣ, �̸�, ����, �޿��� ����϶�.
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE (job_id = 'AD_PRES' AND salary >= 12000) OR (job_id = 'SA_MAN');

-- ����12) ������ AD_PRES �Ǵ� SA_MAN�̰� �޿��� 12000�̻��� ����� �����ȣ, �̸�, ����, �޿��� ����϶�.
SELECT employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE (job_id = ANY('AD_PRES', 'SA_MAN')) AND (salary >= 12000);


