# 🛡️ ESX VIP Weapons Script

This script provides a complete system to manage **VIP weapons** for players using **ESX metadata** and an intuitive **MenuV interface**. Admin functionality is securely controlled via **ACE permissions**.

## 📦 Features

- 🎯 VIP access based on ESX metadata 
- 🧰 Clean MenuV interface for selecting VIP weapons
- 🔒 Admin commands protected via ACE permissions
- 📜 Full logging of key actions (panel access, weapon assignment, etc.)
- 🔧 Easily configurable weapons list 

---

## 📋 Requirements

- ESX framework (legacy preferred) (With Metadata)
- [MenuV](https://github.com/ThymonA/menuv)
- [Ox_lib](https://github.com/overextended/ox_lib/releases)
- Server configured to use ACE permissions

---

## 🔐 Admin-Only ACE Permissions

All admin commands and the VIP weapon panel are protected using **ACE permissions**.  
Only users with the proper ACE flag will be able to access them.

### 🧾 How to Grant Permission

In your `server.cfg`, add the following:

#### ✅ For all admins (group-based):
```cfg
add_ace group.admin "Perri-VipWeapons" allow
```

## ⛑️ Support Discord

[Link](https://discord.com/invite/2Dhdchh6d2)
