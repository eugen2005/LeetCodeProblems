CREATE FUNCTION getNthHighestSalary(N IN NUMBER) RETURN NUMBER IS
result NUMBER;
BEGIN
    SELECT max(Salary) 
    INTO result FROM 
    (select Salary, dense_rank() over (order by Salary desc) P
    from Employee)
    WHERE P = N;    
    RETURN result;
END;

/* The solution from forum for MySQL */
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
DECLARE M INT;
SET M=N-1;
  RETURN (
      SELECT DISTINCT Salary FROM Employee ORDER BY Salary DESC LIMIT M, 1
  );
END;