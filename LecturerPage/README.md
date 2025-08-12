# Lecturer Page – Robot Framework Tests

## Cấu trúc
- `Resource/` — chứa biến, locator, keyword dùng chung
- `Test/` — chứa test cases chính

## Cách chạy
```powershell
cd "<thư mục bạn đã giải nén>"
robot -d results Test/all_in_one.robot
```

Sau khi chạy xong xem `results/log.html` & `results/report.html`.
