# WebDev-Website

## Development

### Pre-requisites

- Install Docker [(Confluence Guide)](https://ubcagrobotappliedai.atlassian.net/wiki/spaces/SysArch/pages/95649821/Docker+Pre-requisites)
- Use the built-in devcontainer configuration [(Confluence Guide)](https://ubcagrobotappliedai.atlassian.net/wiki/spaces/SysArch/pages/55771137/VSCode+Dev+Containers+Guide)

### Local Development

To run the live-reload server locally:

```bash
bun run dev
```

### Commiting

The process of submitting changes to this repository are as follows:

1. Make a branch and link it to the issue you are working on from the [board](https://github.com/UBCAgroBot/ubcagrobot.github.io/issues)

2. Run the following commands before commiting your changes to the git branch:

   ```bash
   bun run fmt
   bun run lint
   ```

3. Make code changes and commit using [convential commit](https://www.conventionalcommits.org/en/v1.0.0/) style. For example, if you made a change to the projects page to fix a bug then your commit may look like the following:

   ```bash
   bug(projects): Change thing to fix x issue.
   ```
