# Wolf Security Suite v1.0.5

<p align="center">
  <img src="https://img.shields.io/badge/Version-1.0.5-green?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Go-1.24-blue?style=for-the-badge&logo=go" />
  <img src="https://img.shields.io/badge/Platform-Linux-orange?style=for-the-badge&logo=linux" />
  <img src="https://img.shields.io/badge/License-BSD--3-lightgrey?style=for-the-badge" />
</p>

## Overview

**Wolf Security Suite** is a modified and hardened edition of the Evilginx 3.3.0 reverse proxy framework, developed as part of an authorized cybersecurity research competition at **Carnegie Mellon University (CMU)**.

This project demonstrates advanced Adversary-in-the-Middle (AiTM) attack techniques for **educational and defensive research purposes only**. All 24 modifications focus on eliminating known Indicators of Compromise (IOCs) and enhancing operational security to simulate real-world APT-level threat actors.

## Key Modifications (24 Changes from Original)

### IOC Removal
- Removed X-Evilginx HTTP header from all proxied requests
- Replaced CA certificate identity (Global Security Services / Global Root CA G3)
- Changed default unauthorized redirect from YouTube Rick Roll to Google
- Modified JS injection path from /s/ to /assets/
- Eliminated all Evilginx references from terminal messages and error outputs
- Changed binary name, config directory, and process identity

### Advanced Enhancements
- **uTLS Integration** - Chrome TLS fingerprint spoofing via utls.HelloChrome_Auto
- **Cloudflare CDN** - Origin IP hidden behind Cloudflare proxy with SSL Full mode
- **Turnstile CAPTCHA** - Bot filtering via Cloudflare Turnstile redirector
- **Custom Session Cookies** - _ga_ prefix mimicking Google Analytics
- **Apache Server Header** - Apache/2.4.41 (Ubuntu) response header injection
- **Wolf Security Gate** - Custom HTML forbidden page for unauthorized access

### Identity Customization
- Custom banner: Advanced Security Research Edition (@Abdo_CMU)
- Version: 1.0.5 (decoupled from original versioning)
- Build target: security-mon
- Config directory: .core_data

## Installation

```bash
git clone https://github.com/abdu-sec/wolf-security-suite.git
cd wolf-security-suite
make
```

## Usage

```bash
# Basic launch
./build/security-mon -p ./phishlets

# With redirectors (Turnstile support)
./build/security-mon -p ./phishlets -t ./redirectors
```

## Research Documentation

This project is accompanied by three research papers totaling 80+ pages:

1. **Complete Source Code Analysis** (51 pages) - 100% coverage of 8,189 lines across 21 Go files
2. **Phishlet Architecture Analysis** (16 pages) - Technical specification, failure modes, and defense framework
3. **APT Attack Lifecycle and Defense** (13 pages) - Financial sector attack analysis with Sigma Rules

## Defense Recommendations

Based on our research, the only complete defense against AiTM attacks is:

**FIDO2/WebAuthn with NO fallback authentication methods**

All other defenses (network detection, DNS monitoring, browser protections) are valuable layers but represent an ongoing arms race. Only cryptographic origin binding eliminates the attack vector entirely.

## Disclaimer

This tool was developed exclusively for an authorized academic cybersecurity competition at Carnegie Mellon University. It must only be used in legitimate, authorized security research and penetration testing with explicit written permission.

## Author

**Abdo Obeid** - CMU Security Research (@Abdo_CMU)

## License

BSD-3-Clause (inherited from original project)
