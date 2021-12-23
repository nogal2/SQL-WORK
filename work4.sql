-- 문제1) 사원들의 이름, 부서번호, 부서명을 출력하라
SELECT e.first_name, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- 문제2) 30번 부서의 사원들의 이름,직업,부서명을 출력하라
SELECT e.first_name, e.job_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND department_id = 30;
    
SELECT e.first_name, e.job_id, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
    AND e.job_id = j.job_id
    AND department_id = 30;

-- 문제3) 커미션을 받는 사원의 이름, 직업, 부서번호,부서명을 출력하라
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.commission_pct IS NOT NULL;

-- 문제4) 지역번호 2500 에서 근무하는 사원의 이름, 직업,부서번호,부서명을 출력하라
SELECT e.first_name, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.location_id = 2500;


-- 문제5) 이름에 A가 들어가는 사원들의 이름과 부서이름을 출력하라
SELECT e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND (e.first_name LIKE '%A%'); 

-- 문제6) 사원이름과 그 사원의 관리자 이름을 출력하라
SELECT e.first_name, m.first_name
FROM employees e , employees m
WHERE e.employee_id = m.manager_id;
--e의 사원 아이디와 m의 매니저 아이디가 같으면.
--e의 이름과 m 의 이름을 출력.
--e의 사원아이디는 149, m의 매니저 아이디는 149

-- 문제7) 사원이름과 부서명과 월급을 출력하는데 월급이 3000 이상인 사원을 출력하라
SELECT e.first_name, d.department_name, e.salary 
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.salary >= 3000;

-- 문제8) TJ 이란 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하라
SELECT a.first_name, a.hire_date, b.first_name, b.hire_date
FROM employees a, employees b       -- a: TJ, b: 사원들
WHERE a.first_name = 'TJ'
    AND a.hire_date < b.hire_date;


-- 문제9) 급여가 3000에서 5000사이인 사원의 이름과 소속부서명 출력하라
SELECT e.first_name, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND e.salary >= 3000 AND e.salary <= 5000;

-- 문제10) ACCOUNTING 부서 소속 사원의 이름과 입사일 출력하라
SELECT e.first_name, e.hire_date
FROM employees e, departments d
WHERE e.department_id = d.department_id
    AND d.department_name = 'Accounting';

-- 문제11) 급여가 3000이하인 사원의 이름과 급여, 근무지를 출력하라.
SELECT e.first_name, e.salary, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id AND l.location_id = d.location_id
    AND e.salary >= 3000;