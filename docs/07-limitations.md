# 7. Limitations and future work

## Limitations

- **No secondary domain controller.** A second DC (DC-02) was planned and never built because of host RAM limits (32 GB shared across the VMs and the host). A production domain would run at least two for availability. A second DC is redundancy, not backup: replication copies accidental deletions to both controllers.
- **No backup and restore testing.** System state backups and database restores were planned and not performed, so the recovery story in this lab is untested.
- **No Group Policy.** No GPOs or security baselines (for example browser or CIS settings) were applied to the domain; the AD setup covers OUs, a user, groups, DNS, and DHCP only.
- **HTTPS not enabled** on the web server (self-signed certificate and HSTS planned).
- **No WAF.** Attacks sent in POST bodies do not appear in Wazuh because the access log omits request bodies.
- **No XSS demonstration.** Only a URL-based XSS probe was run (and detected by Wazuh). A stored XSS comparison between the vulnerable and secure pages was not completed.
- **Default Wazuh rules** with no custom decoders or alert tuning.
- **Single-host virtual lab.** Networking is simulated in Hyper-V, not physical hardware, and the pfSense build was a development release.
- **Windows 10** reached end of support in October 2025; a current Windows 11 client would be more representative.

## Future work

1. Complete the backup and restore tests (web server and DC-01 system state).
2. Add HTTPS, an HTTP-to-HTTPS redirect, and HSTS.
3. Deploy ModSecurity with the OWASP Core Rule Set and compare detection.
4. Add a second DC when resources allow.
5. Apply a CIS or Microsoft security baseline through Group Policy and track the Wazuh SCA score.
6. Add an attacker VM (Kali) and run SSH brute force against fail2ban and Wazuh.
7. Move to VLANs with a trunk into pfSense.
