# g3ROG-DARK Clean Source of Truth

**Suggested filename:** `docs/aida64/AIDA64-Report-20260509_v2-clean-source.md`

## Build Overview

### Document Header

- **Build name:** g3ROG-DARK
- **Source report:** AIDA64-Report-20260509_v2
- **Report generated:** 2026-05-09 01:43
- **AIDA64 version:** 8.30.8300
- **Purpose:** Sanitized hardware and configuration source-of-truth for repo documentation, troubleshooting, and Codex handoff
- **Privacy note:** This document intentionally excludes serial numbers, MAC addresses, GUIDs/UUIDs, Windows profile paths, license/product IDs, raw device instance paths, and the full raw AIDA dump

### Executive Summary

g3ROG-DARK is a high-end AM5 build centered on the ASUS ROG Crosshair X870E Dark Hero and a Ryzen 7 9850X3D, paired with an RTX 5090, 64 GB of DDR5, and multiple SSD tiers including Gen5 NVMe. The report confirms the CPU is now operating in the correct **8-core / 16-thread** topology, which means SMT is functioning again after the earlier BIOS-side issue. Memory is running at **DDR5-6200 CL32 1T**, the discrete GPU is linked at **PCIe 5.0 x16**, and the storage layout includes **two Crucial T705 Gen5 NVMe drives** plus **two Samsung 860 EVO SATA SSDs**.

The display inventory shows a **four-monitor setup** with both the AMD integrated graphics and the RTX 5090 active in the system. The report does not explicitly map each display to a specific GPU, but the mixed iGPU + dGPU layout is consistent with the detected hardware and is not presented as an error.

At the moment this report was captured, the system looked broadly healthy: **Secure Boot is enabled, TPM 2.0 is present, major temperatures are reasonable, and report-level SMART status is OK**. The main follow-up items are practical ones rather than red flags: confirm memory stability at the configured DDR5-6200 profile, verify exact M.2 slot mapping because SMBIOS slot occupancy does not fully line up with the installed NVMe drives, and keep an eye on one Samsung SATA SSD’s historical CRC error counter.

### Confirmed Core Hardware

| Component | Confirmed model | Notes |
|---|---|---|
| CPU | AMD Ryzen 7 9850X3D | Granite Ridge, 8 cores / 16 logical processors, 120 W TDP |
| Motherboard | ASUS ROG Crosshair X870E Dark Hero | AM5, ATX, 2 PCIe x16 slots, 5 M.2, 4 DDR5 DIMM slots |
| Chipset | AMD X870E | Report also identifies AMD K1A.4 IMC + AMD K1A.4 FCH |
| BIOS | AMI UEFI 0804 | System BIOS date 2026-04-09, AGESA ComboAm5PI 1.3.0.1 |
| Memory | 64 GB Corsair CMP64GX5M2B6000Z30 | 2 x 32 GB DDR5, SK hynix DRAM, running DDR5-6200 |
| Discrete GPU | ASUS ROG Astral RTX 5090 White | NVIDIA GB202, 32 GB GDDR7, PCIe 5.0 x16 |
| Integrated GPU | AMD Radeon(TM) Graphics | Present and driver-loaded |
| Storage | Crucial CT2000T705SSD3, Crucial CT1000T705SSD3, 2 x Samsung SSD 860 EVO 2TB | Gen5 NVMe + SATA SSD mix |
| Networking | MediaTek MT7927 Wi-Fi 7, Realtek RTL8127 10GbE, Realtek RTL8126 5GbE | Bluetooth adapter also present |
| Audio | AMD display audio, NVIDIA HD Audio, Realtek USB audio device present | Additional external audio endpoints are also installed |
| Cooling / telemetry | AIO pump telemetry present | Pump, CPU fan, chassis fan, and GPU fan telemetry detected; exact cooler model not shown |
| Operating system | Windows 11 Enterprise 25H2 | Build 10.0.26200.8328, DirectX 12.0 |

## Platform and Firmware

### CPU Configuration

| Property | Value |
|---|---|
| CPU model | AMD Ryzen 7 9850X3D |
| CPU alias | Granite Ridge |
| Physical cores | 8 |
| Logical processors | 16 |
| SMT status | **Enabled / working** |
| SMT / CMP units | 2 / 8 |
| Package / socket | Socket AM5, 1718-contact OLGA package |
| Cache | L1 code 32 KB per core, L1 data 48 KB per core, L2 1 MB per core, L3 96 MB |
| Current clock snapshot | Overclock section shows ~5550 MHz CPU clock at capture |
| DMI maximum clock field | 5650 MHz |
| Base fabric / memory clocks | 100 MHz base clock, 3100 MHz memory bus / 6200 MT/s effective |
| Typical power | 120 W |
| Hypervisor / virtualization note | CPUID reports **Hypervisor Present**; firmware-level SVM enablement is not cleanly exposed in this capture |

The report clearly shows **CPU #1 through CPU #16**, which is the cleanest confirmation that the chip is now being presented correctly to the OS as **8 cores / 16 threads**.

**Important configuration note:** SMT had previously been found disabled in BIOS and was restored to **Auto / enabled** before this v2 report was generated. This report reflects the corrected state.

### Motherboard and BIOS

| Property | Value |
|---|---|
| Motherboard | ASUS ROG Crosshair X870E Dark Hero |
| Form factor | ATX |
| CPU socket | 1 x AM5 |
| RAM slots | 4 x DDR5 DIMM |
| Expansion slots | 2 x PCIe x16, 5 x M.2 |
| Integrated devices | Audio, video, dual LAN, Wi-Fi |
| BIOS type | AMI UEFI |
| BIOS version | 0804 |
| BIOS date | 2026-04-09 |
| AGESA | ComboAm5PI 1.3.0.1 |
| SMBIOS version | 3.6 |
| UEFI boot | Yes |
| Secure Boot | Enabled |
| TPM | TPM 2.0 device present, vendor reported as AMD |

**Board-level notes and caveats:**

- The report’s generic board descriptor string says “Dual Gigabit LAN,” but the actual PCI inventory shows a **Realtek RTL8126 5GbE** controller and a **Realtek RTL8127 10GbE** controller. Treat the DMI descriptor wording as generic rather than authoritative.
- SMBIOS slot occupancy does **not** fully align with the rest of the report. DMI marks **PCIEX16_1** as in use and **M.2_1** as in use, but the report also clearly shows **two separate Phison PCIe 5.0 x4 NVMe controllers** and two installed Crucial T705 drives. Slot mapping should be verified manually in BIOS, HWiNFO, or by physical inspection if exact placement matters.

### Operating System and Platform

| Property | Value |
|---|---|
| OS edition | Windows 11 Enterprise |
| OS version | 10.0.26200.8328 |
| Marketing label in report | Win11 25H2 2025 Update |
| Kernel type | Multiprocessor Free (64-bit) |
| OS language | English (United States) |
| Install date | 2026-05-05 |
| DirectX | 12.0 |
| OpenGL | 10.0.26100.8328 |
| UEFI boot | Yes |
| Secure Boot | Enabled |
| TPM | 2.0 |
| UAC | Enabled |
| DEP / NX | Supported by OS and CPU; active for applications and drivers |

**Not shown in report:** a clean, user-friendly “Virtualization enabled in firmware” field.
**Shown in report:** CPUID reports **Hypervisor Present**, which means a Windows hypervisor layer is active and some low-level virtualization capability flags may be masked in this capture.

## Memory and Performance

### Memory Configuration

| Property | Value |
|---|---|
| Installed memory | 64 GB |
| OS-visible physical memory | ~62.5 GB |
| Module count | 2 |
| Module size | 32 GB each |
| Module SKU | Corsair CMP64GX5M2B6000Z30 |
| DRAM vendor | SK hynix |
| Memory type | DDR5 SDRAM |
| Channel mode | Dual channel, 128-bit active |
| Current memory speed | DDR5-6200 (3100 MHz real clock) |
| Current timings | 32-38-38-80 |
| Command rate | 1T |
| EXPO / profile voltage | 1.40 V VDD, 1.40 V VDDQ, 1.80 V VPP |
| Memory controller profile voltage | 1.20 V in EXPO data |
| Sensor-side VDDIO snapshot | 1.394 V |
| Sensor-side SoC snapshot | 1.234 V |

The memory is clearly running **above default JEDEC speed**. SPD data shows a base DDR5-4800 profile, plus higher-performance profiles including:

- **Profile 1:** DDR5-6000, 30-36-36-76
- **Profile 2:** DDR5-6200, 32-38-38-80

The current running state in the report matches the faster profile path: **DDR5-6200 CL32-38-38-80 1T**.

### Benchmark Snapshot

These are **AIDA64 snapshot benchmarks from the report**, not a final tuning verdict and not a substitute for load stability validation.

| Benchmark | Result |
|---|---|
| Memory Read | 63,877 MB/s |
| Memory Write | 88,113 MB/s |
| Memory Copy | 61,137 MB/s |
| Memory Latency | 87.5 ns |

## Graphics and Displays

### GPU Configuration

| Adapter | Confirmed model | Key details | Driver |
|---|---|---|---|
| Discrete GPU | ASUS ROG Astral RTX 5090 White | NVIDIA GB202-300-A1, 32 GB GDDR7 (Samsung), 512-bit, WDDM 3.2, PCIe 5.0 x16 @ x16 | 32.0.15.9636 / ForceWare 596.36, dated 2026-04-22 |
| Integrated GPU | AMD Radeon(TM) Graphics | 2 GB reported, Granite Ridge integrated graphics present | 32.0.21036.18, Radeon Software 25.10.36, dated 2025-11-11 |

**Discrete GPU details from the report:**

- **GPU code name:** GB202-300-A1
- **Architecture:** NVIDIA Blackwell
- **Bus:** PCI Express 5.0 x16 @ 5.0 x16
- **VRAM:** 32 GB GDDR7
- **Bus width:** 512-bit
- **Effective memory clock:** 28,002 MHz
- **Bandwidth:** 1750.1 GB/s
- **DirectX hardware support:** DirectX 12
- **WDDM:** 3.2

**Clock note:** the dedicated GPU section shows a lower live clock snapshot at capture, while the overclock section lists **2805 MHz GPU clock** and **14001 MHz memory clock**. That is normal behavior for a GPU moving between idle and active states.

**Multi-GPU layout note:** the report shows both the AMD iGPU and the RTX 5090 active in the system. That supports the possibility of a split monitor layout where side displays are handled by the iGPU and main high-refresh displays live on the RTX card. The report does **not** explicitly map individual monitors to specific GPUs, so that should be treated as a reasonable interpretation rather than a hard assertion.

### Display Layout

The report detects **four displays**:

- **2 x LG UltraGear+**
- **2 x Sceptre P30**

Additional display notes from the report:

- The Windows desktop snapshot at capture was **5120 x 1440 @ 240 Hz**
- The multi-monitor section shows **four active logical displays**, with one marked as primary
- The two Sceptre P30 panels are identified as **30-inch class ultrawides** with support up to **200 Hz**
- The LG UltraGear+ entries show support up to **240 Hz**

**Not shown in report:** a clean per-monitor GPU attachment map.

**Display inconsistency worth noting:** one LG monitor block’s EDID data reports a lower maximum resolution than the active desktop snapshot reported elsewhere. Treat the **Desktop** and **Multi-Monitor** sections as the better description of the active runtime layout, and verify exact panel timing in Windows or GPU control software if needed.

## Storage, PCIe, and Network

### Storage Configuration

| Drive model | Type / interface | Capacity | Link info | Health / SMART | Temp snapshot | Likely role |
|---|---|---:|---|---|---:|---|
| Crucial CT2000T705SSD3 | NVMe SSD | 2 TB class (1863 GB usable) | PCIe 5.0 x4 | Report-level SMART summary says OK; no fault flagged in parsed sections | 53 °C | System / boot drive |
| Crucial CT1000T705SSD3 | NVMe SSD | 1 TB class (931 GB usable) | PCIe 5.0 x4 | Report-level SMART summary says OK; no fault flagged in parsed sections | 43 °C | Secondary local NVMe |
| Samsung SSD 860 EVO 2TB | SATA SSD | 2 TB class | SATA III | SMART details individually present and overall healthy | 31 °C | Data / auxiliary volume |
| Samsung SSD 860 EVO 2TB | SATA SSD | 2 TB class | SATA III | SMART details individually present and overall healthy | 31 °C | Data / auxiliary volume |

**Drive layout notes:**

- The report summary lists **two Crucial T705 drives** and **two Samsung 860 EVO SATA SSDs**
- The **2 TB T705** is the likely system drive because its physical-drive layout includes EFI and recovery partitions and it backs the main **C:** volume
- The **1 TB T705** backs the **R:** volume
- The two Samsung SSDs back the **S:** and **T:** volumes

**SMART note:** the report summary says **SMART Hard Disks Status: OK**.

**Important follow-up note:** one Samsung 860 EVO shows a **very large historical SMART C7 CRC Error Count** while still remaining overall healthy. That usually points to **SATA link / cable / signal history**, not NAND failure. It is worth checking whether that counter is still increasing.

### PCIe and Lane Configuration

| Item | Reported link / lane state |
|---|---|
| RTX 5090 | PCIe 5.0 x16 @ x16 |
| NVMe controller #1 | Phison PS5026 PCIe 5.0 x4 NVMe 2.0 controller |
| NVMe controller #2 | Phison PS5026 PCIe 5.0 x4 NVMe 2.0 controller |
| Wi-Fi adapter | PCIe 3.0 x1 |
| Realtek RTL8126 5GbE | PCIe 3.0 x1 |
| Realtek RTL8127 10GbE | PCIe 4.0 x1 |

**SMBIOS / slot inventory from the board:**

- **PCIEX16_1:** PCIe 5.0 x16, **In Use**
- **PCIEX16_2:** PCIe 4.0 x16 physical / x4 electrical, **Available**
- **M.2_1:** x4, **In Use**
- **M.2_2 / M.2_3 / M.2_4 / M.2_5:** x4, reported **Available**
- **M.2(WiFi):** x1, **In Use**

**Lane / topology note:** the GPU lane state looks correct. The main thing to verify manually is the exact M.2 slot occupancy, because the SMBIOS slot report and the actual detected NVMe devices do not line up perfectly.

### Networking

| Adapter | Interface | Bus / driver | Runtime note |
|---|---|---|---|
| MediaTek MT7927 Wi-Fi 7 | Wireless | PCIe 3.0 x1, Windows device driver 5.7.0.5659 | Present; no meaningful traffic captured at report time |
| MediaTek Bluetooth adapter | Bluetooth | Windows device driver 1.1146.0.576 | Present |
| Realtek RTL8127 10GbE | Ethernet | PCIe 4.0 x1, Windows device driver 1127.28.50.1224 | Linked at **2500 Mbps** at capture |
| Realtek RTL8126 5GbE | Ethernet | PCIe 3.0 x1, Windows device driver 1126.28.50.1224 | Present; no active link speed shown in the snapshot |

**Privacy note:** MAC addresses, IP addresses, DHCP, gateway, and DNS detail are intentionally excluded here.

## Thermals, Power, and Validation

### Cooling and Sensor Snapshot

These are **snapshot values from the AIDA64 report at the time of capture**, not sustained load-test numbers.

#### Temperature Snapshot

| Sensor | Value |
|---|---:|
| Motherboard | 37 °C |
| CPU | 50 °C |
| CPU Package | 60 °C |
| CPU CCD #1 | 52 °C |
| PCH diode #1 | 58 °C |
| PCH diode #2 | 61 °C |
| VRM | 46 °C |
| RTX 5090 GPU core | 33 °C |
| RTX 5090 GPU memory | 44 °C |
| Integrated GPU | 40 °C |
| Integrated GPU SoC | 46 °C |
| DIMM2 | 42 °C |
| DIMM4 | 41 °C |
| Crucial CT2000T705SSD3 | 53 °C |
| Crucial CT1000T705SSD3 | 43 °C |
| Samsung 860 EVO #1 | 31 °C |
| Samsung 860 EVO #2 | 31 °C |

#### Fan / Pump Snapshot

| Sensor | Value |
|---|---:|
| CPU fan | 1140 RPM |
| Chassis fan #1 | 467 RPM |
| AIO pump | 3524 RPM |
| RTX 5090 fan #1 | 619 RPM |
| RTX 5090 fan #2 | 620 RPM |

**Thermal read:** nothing in this snapshot looks alarming. The **2 TB Gen5 T705 at 53 °C** is still well within a normal “watch it, but do not panic” range for a high-performance PCIe 5.0 SSD.

### Power and PSU Notes

These are snapshot telemetry values from board / device sensors.

| Reading | Value |
|---|---:|
| CPU package power | 71.84 W |
| RTX 5090 GPU power | 61.56 W |
| Integrated GPU SoC power | 15.00 W |
| Board-estimated +12 V rail power | 222.95 W |
| Board-estimated total system power | 274.02 W |
| CPU core voltage | 1.332 V |
| CPU VID | 0.356 V |
| SoC voltage | 1.234 V |
| VDDIO | 1.394 V |
| +12 V rail | 11.891 V |
| RTX 12VHPWR voltage | 12.085 V |

**PSU model:** Not shown in report.
**Telemetry note:** the report exposes useful live power and voltage data, but it does **not** identify the retail PSU model.

### Stability / Validation Notes

The report validates the following:

- **CPU recognized correctly** as **Ryzen 7 9850X3D**
- **8 physical cores / 16 logical processors confirmed**
- **SMT is working again** in this v2 capture
- **Memory is running at DDR5-6200**, not default JEDEC
- **Timings are CL32-38-38-80 with CR1**
- **GPU is detected correctly** and linked at **PCIe 5.0 x16 @ x16**
- **Report-level storage health is OK**
- **Major temperatures look normal** for the captured state
- **UEFI boot and Secure Boot are active**
- **TPM 2.0 is present**
- **Hypervisor is present** in CPUID, which is consistent with a virtualization-capable Windows environment

Still worth validating under real load:

- **OCCT** for CPU, memory, and mixed system stress
- **Cinebench** for quick CPU sanity and thermals
- **y-cruncher** for tougher memory / IMC / CPU stability
- **MemTest / Karhu / TM5 class memory validation**
- **3DMark** for GPU + platform behavior
- **Long gaming session testing** on the actual high-refresh display setup
- **HWiNFO logging** during CPU-heavy, GPU-heavy, and disk-heavy sessions
- **Sustained disk testing** on the T705 drives to confirm temperature behavior and throttling margins

### Issues / Risks / Things to Verify

- Confirm that **repeated boots are now normal** after the SMT configuration change
- Confirm **DDR5-6200 CL32 1T** remains stable in long-session and cold-boot scenarios
- Verify **exact M.2 physical slot mapping**, because SMBIOS occupancy does not fully match the installed NVMe inventory
- Verify the **2 TB T705** stays comfortable under sustained sequential writes
- Check whether the Samsung 860 EVO’s **C7 CRC error counter** is still increasing; if it is, inspect SATA cabling / port quality
- Confirm the **RTX 5090 remains PCIe 5.0 x16** under GPU load, not just in an inventory snapshot
- Confirm the **mixed iGPU + dGPU monitor layout** does not interfere with game launch behavior, HDR behavior, or preferred-GPU selection
- Confirm the **10GbE controller** negotiates at the speed you expect with the actual switch / router / peer device, since the captured link was **2500 Mbps**
- Confirm there are **no Device Manager warnings** or stale driver leftovers
- Confirm **AIO pump and chassis fan behavior** under sustained CPU/GPU load
- If exact per-monitor GPU mapping matters, verify it in Windows or GPU control software because the AIDA report does not spell it out cleanly

## Repo Handoff and Privacy

### Codex Follow-Up Tasks

Use this sanitized Markdown file as the source-of-truth input for repo documentation work.

- Update `README.md`
- Update `docs/machines/g3rog-dark/specs/`
- Update `docs/machines/g3rog-dark/exports/`
- Update `docs/machines/g3rog-dark/bios-settings.md`
- Update `docs/machines/g3rog-dark/validation/`
- Create or update `docs/aida64/README.md`
- Remove or replace stale references to **Ryzen 7 9800X3D** if the current build is now **Ryzen 7 9850X3D**
- Confirm no raw AIDA reports, serial numbers, MAC addresses, UUIDs, or Windows profile paths are committed
- Add privacy notes to `docs/aida64/README.md`
- Add benchmark / stability placeholders for future test results

Additional repo-safe tasks worth doing:

- Add a short **“What changed”** note covering the SMT restoration and CPU topology fix
- Add a **“Known quirks / verify later”** section covering M.2 slot mapping and the Samsung CRC error counter
- Add a **display topology note** explaining that the report shows both the iGPU and the RTX card active, but does not explicitly map each monitor to a GPU

### Redaction Summary

This sanitized source intentionally excludes:

- Drive serial numbers
- Display serial numbers
- MAC addresses
- IP addresses and private network details
- UUIDs / GUIDs
- Windows user profile paths
- Product IDs, activation data, and license keys
- Raw device instance paths
- Full raw AIDA64 dump content
- Personally identifying metadata that is not required for hardware documentation

This document keeps the hardware, firmware, performance, and validation details that matter for documentation while stripping the stuff that does not belong in repo-facing build notes.
