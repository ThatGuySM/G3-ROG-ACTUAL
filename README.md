![G3-ROG-ACTUAL Banner](assets/banner.png)

# G3-ROG-ACTUAL – System Health & Specs

Welcome to the system audit for **ThatGuyᴼᴳ’s battle-station** — codename **G3-ROG-ACTUAL**.
This README captures the rig’s full specs, health status, and benchmark results.
It is designed for GitHub presentation with quick-links, badges, and collapsible sections.

![Status](https://img.shields.io/badge/Status-Healthy-brightgreen)
![CPU](https://img.shields.io/badge/CPU-Ryzen%207%209800X3D-orange)
![GPU](https://img.shields.io/badge/GPU-RTX%205090-white)
![RAM](https://img.shields.io/badge/RAM-64GB_DDR5_6000-blue)
![Storage](https://img.shields.io/badge/Storage-7TB-purple)
![OS](https://img.shields.io/badge/OS-Windows%2011%2025H2-lightgrey)
![CI](https://github.com/ThatGuySM/G3-ROG-ACTUAL/actions/workflows/ci.yml/badge.svg)

---

## Snapshot Notice

This repo is a **published system snapshot**, not a live telemetry feed.
The current published markdown snapshot was refreshed on **April 15, 2026**.
The downloadable PDF in `docs/` was regenerated from the same 2026 markdown snapshot.

## Latest Audit

- [Latest audit entrypoint](docs/LATEST.md)
- [Documentation hub](docs/README.md)
- [System health report](docs/G3-ROG-ACTUAL_System_Health_Report.md)
- [PDF report](docs/G3-ROG-ACTUAL_System_Health_Report.pdf)
- [Battlestation spec sheet](docs/G3-ROG-ACTUAL_Battlestation_Spec_Sheet.md)
- [BIOS profile notes](bios/g3rog_actual_bios_full_profile.md)

---

## Table of Contents

- [Latest Audit](#latest-audit)
- [Repository Layout](#repository-layout)
- [System Summary](#system-summary)
- [CPU & Motherboard](#cpu--motherboard)
- [Memory](#memory)
- [Graphics & Displays](#graphics--displays)
- [Storage](#storage)
- [Network](#network)
- [Sensors](#sensors)
- [Benchmarks (AIDA64)](#benchmarks-aida64)
- [Processes & Autostarts](#processes--autostarts)
- [Security](#security)
- [Final Takeaway](#final-takeaway)

---

## Repository Layout

- `docs/`: published reports, spec sheets, templates, and latest-audit navigation
- `benchmarks/`: benchmark exports and summaries
- `logs/`: sanitized diagnostic or monitoring logs
- `bios/`: BIOS tuning notes and profile references
- `scripts/`: repo setup, release, and validation helpers

---

## System Summary

- **Computer:** g3ROG-actual  
- **OS:** Windows 11 Enterprise 10.0.26200.8246 (Win11 25H2 2025 Update)  
- **DirectX:** 12.0  
- **User/Domain:** Redacted in published snapshot  

## CPU & Motherboard

- **CPU:** AMD Ryzen 7 9800X3D – observed at 5.425 GHz in AIDA64  
- **Board:** ASUS ROG Strix B650E-F Gaming WiFi  
- **Chipset:** AMD B650E / K1A.4 FCH / K1A.4 IMC  
- **BIOS:** AMI (03/11/2026), restored from saved profile backup  

## Memory

- **Total:** 64 GB DDR5 (Corsair Dominator Titanium RGB)  
- **Effective Speed:** Dual DDR5-6000, 30-36-36-76 CR1  

## Graphics & Displays

- **Discrete GPU:** NVIDIA GeForce RTX 5090 (32607 MB), ASUS ROG Astral variant  
- **Integrated GPU:** AMD Radeon(TM) Graphics (2 GB)  
- **Monitors:** 2× LG UltraGear 49GR85DC-B 49-inch ultrawides, 2× Sceptre C305B-200UN1 30-inch ultrawides  

## Storage

- Crucial T705 1 TB (Gen5 NVMe)  
- Crucial T705 2 TB (Gen5 NVMe)  
- Samsung 860 EVO 2 TB ×2 (SATA SSD)  
- **Total:** 6519.8 GB formatted local storage, SMART status OK  

## Network

- **Provider:** Frontier  
- **Desktop Test:** 2347.18 Mbps down / 2224.44 Mbps up  
- **Router Test:** 2.36 Gbps down / 2.55 Gbps up on the eero Max 7 gateway  
- **Ping:** 6 ms (Secaucus, NJ)  

## Sensors

- **CPU:** 44 C, CPU diode 56 C, package 55 C  
- **GPU:** RTX 5090 core 38 C, memory 48 C  
- **RAM:** 44 C / 43 C across the DIMMs  
- **Storage:** 51 C on the 2 TB T705, 35 C on the 1 TB T705, 28 C on both Samsung SATA SSDs  
- **Fans:** CPU 1076 RPM, Chassis 665 RPM, AIO Pump 1737 RPM, RTX 5090 fans at 0 RPM while idle  
- **Voltages:** +12 V 11.922, +5 V 5.078, +3.3 V 3.313 → stable  

## Benchmarks (AIDA64)

- **Memory:** Read 63748 MB/s, Write 85000 MB/s, Copy 61203 MB/s, Latency 80.8 ns  
- **CPU:** ZLib 1458.2 MB/s, AES 86596 MB/s, SHA3 5595 MB/s  
- **FPU:** Mandel 120774 it/s, FP32 Ray-Trace 49594 KRay/s, FP64 Ray-Trace 27022 KRay/s  

## Processes & Autostarts

- Adobe Acrobat/GC sync, AMD Noise Suppression, Corsair iCUE, Logitech G Hub, OneDrive, Slack, Notion, Signal, SteelSeries GG, and Elgato Stream Deck.  
- **Note:** Heavy by minimalist standards, but consistent with a creator/gaming workstation profile.  

## Security

- **Windows Update:** Latest detected hotfix `KB5086672`, installed 2026-04-08.  
- **Antivirus:** Windows Defender 4.18.26030.3011 reported current on 2026-04-15.  
- **Firewall:** Windows reports the firewall disabled on the current domain-network setup by deliberate choice.  
- **Recommendation:** Treat the firewall state as an intentional environment decision and document it clearly rather than presenting it as accidental drift.  

---

## Final Takeaway

**g3ROG-actual is a current-generation powerhouse rig running fast, stable, and well-tuned after its March 2026 BIOS refresh.**  
The markdown and PDF reports are now aligned to the same 2026 snapshot.
