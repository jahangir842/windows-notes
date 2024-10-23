### Reference:

- https://answers.microsoft.com/en-us/windows/forum/all/windows-temporary-user-profile-temp-issue/5fbefc7c-0b82-4395-bfda-6d7e2ebeacc6

---

### Registry ProfileList:

HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList

select the required profile

In the right panel, double click on the ProfileImagePath value name to modify it.

Verify that the State DWORD is set with a value data of 0 (number zero).
