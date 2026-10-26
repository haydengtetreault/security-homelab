# 6. Troubleshooting and lessons learned

| Problem | Cause | Fix / lesson |
|---|---|---|
| LAN VM could not ping pfSense | Ping target typed as 10.0.1.254 instead of 10.0.10.254 | Check the address before suspecting the network |
| DMZ web server unreachable | New pfSense interface had no rules; Ubuntu had no persistent gateway | Add DMZ rules; set static IP, gateway, and DNS with nmcli |
| Web pages "not loading" | Browser used HTTPS against a server only serving HTTP (Apache), and the reverse for Wazuh | Always include the scheme when testing by IP |
| PHP install failed | Typo in package name | Read the error; it names the package |
| PHP 500 error | Config file still held the placeholder DB password | Check `/var/log/apache2/error.log` first |
| `DROP TABLE` succeeded unexpectedly | Test was run as root, not the app user | Run `SELECT CURRENT_USER();` before testing privileges |
| Table creation failed | `TEST` typed instead of `TEXT`; mismatched quotes left MariaDB waiting for input | Paste SQL from a file or script |
| SSH "connection refused" | `openssh-server` not installed | Refused = nothing listening; timeout = firewall |
| SSH `Permission denied (publickey)` | Key never added; `-i` pointed at the `.pub` file; key not in default folder | Compare fingerprints with `ssh-keygen -lf`; use the private key |
| Locked out of SSH | Password login disabled before the key worked | Test key login in a second session first; the Hyper-V console is the safety net |
| Wazuh install failed repeatedly | Root partition only 19 GB, dashboard install ran out of disk; earlier attempt used the multi-node command and left a broken dpkg state | Check `df -h` first; grow the partition with `growpart` and `resize2fs`; force-remove broken package scripts |
| Wazuh agent would not enroll | Install command used the wrong manager IP and ufw blocked 1515 | Verify the manager address in generated commands |
| Windows agent slow to appear | First check-in took several minutes | Verify with the agent log before changing anything |
| Apache failed to restart | The word `sudo` was pasted into the config file | `apachectl configtest` names the file and line |
| DMZ not isolated | Allow-any rule sat above the block rule | pfSense uses first match; verify order and test it |

## Habits this reinforced

- Test one layer at a time and stop at the first failure.
- Keep a second access path (console) when changing remote access.
- Take snapshots before risky changes.
- Capture before and after evidence while building, not afterward.
