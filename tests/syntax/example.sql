2025-02-26T00:15:14.497200Z	42576 Query	use `wordpress`
2025-02-26T00:15:14.497851Z	42576 Query	START TRANSACTION
2025-02-26T00:16:32.004127Z	42576 Query	SELECT * FROM wp_67_blogs WHERE blog_id IN (2)
2025-02-26T00:15:14.501149Z	42576 Query	COMMIT

2025-02-26T00:15:31.337741Z 42583 Query SET NAMES utf8mb4;
2025-02-26T00:15:31.337877Z 42583 Query SET NAMES 'utf8mb4' COLLATE 'utf8mb4_unicode_520_ci';
2025-02-26T00:15:31.337932Z 42583 Query SELECT @@SESSION.sql_mode;
2025-02-26T00:15:31.338034Z 42583 Query SET SESSION sql_mode='NO_ZERO_IN_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
2025-02-26T00:15:31.338114Z 42583 Init DB wordpress;
2025-02-26T00:15:31.339843Z 42583 Query SELECT wp_67_blogs.blog_id FROM wp_67_blogs WHERE domain = 'wordpress.development.local' AND path IN ( '/6.7/toys/', '/6.7/', '/' ) ORDER BY CHAR_LENGTH(path) DESC LIMIT 1;
2025-02-26T00:15:31.340294Z 42583 Query SELECT * FROM wp_67_blogs WHERE blog_id IN (2);
