# SSH Key Setup

This document records the recommended SSH key setup for GitHub on this machine.

## Generate a GitHub SSH key

Use an `ed25519` key and keep it separate from other SSH identities:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keygen -t ed25519 -C "your_email@example.com" -f ~/.ssh/id_ed25519_github
```

## Show the public key

Print the public key and add it to GitHub:

```bash
cat ~/.ssh/id_ed25519_github.pub
```

## SSH config for GitHub

Create or update `~/.ssh/config` with:

```sshconfig
Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_ed25519_github
  IdentitiesOnly yes
```

## Permissions

Set recommended permissions:

```bash
chmod 600 ~/.ssh/config ~/.ssh/id_ed25519_github
chmod 644 ~/.ssh/id_ed25519_github.pub
```

## Test the connection

Verify that GitHub accepts the key:

```bash
ssh -T git@github.com
```

## Notes

- GitHub recommends `ed25519` for most modern systems.
- If `ed25519` is unavailable on an older system, use RSA 4096-bit instead:

```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```
