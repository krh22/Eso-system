---
tags: [component]
energy: 
created: 2026-04-11
---

# Action Manager

## Purpose
<!-- Briefly describe what this component does for the system -->

## Active Projects & Tasks
```dataview
TABLE WITHOUT ID
    file.link AS "Item",
    energy AS "Energy",
    status AS "Status"
FROM [[#]]
WHERE contains(file.folder, "07_Life_Domains") OR contains(file.folder, "06_Mission_Control")
SORT energy DESC
```
