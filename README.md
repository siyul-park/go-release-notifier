# Notify pkg.go.dev on Release

Automatically notify `pkg.go.dev` about new releases in your GitHub repository! This GitHub Action sends a POST request to update the Go module registry whenever a new release is published, ensuring that your Go packages are instantly available for developers to discover and use.

## 🚀 Why Use This Action?

When you release a new version of your Go module, it’s important to notify Go's module proxy (`pkg.go.dev`) so that it can reflect the latest changes. Without this, your users might not be able to easily access your latest version. This action automates that process, saving you time and ensuring your Go module stays up to date on the Go module index.

### Key Benefits:
- **Automatic Updates**: No more manually updating `pkg.go.dev`. This action does it for you.
- **Streamlined Workflow**: Seamlessly integrate this action into your release process with minimal setup.
- **Easy to Use**: Just set it up, and you're ready to go!

## ⚙️ Inputs

- `repository`: **The GitHub repository (e.g., `owner/repo`).** *(Default: `${{ github.repository }}` — the current repository where the action is triggered)*
- `release_tag`: **The release tag name (e.g., `v1.0.0`).** *(Default: `${{ github.event.release.tag_name }}` — the release tag name from the event)*
- `base_url`: **The base URL for pkg.go.dev.** *(Default: `https://pkg.go.dev/fetch` — no need to set unless you have a custom URL)*

> All values are **optional**, and the action will automatically use the default values based on the GitHub repository and release tag that triggered the workflow. You do **not** need to set them unless you want to customize the notification.

## 🎯 Example Usage

The action automatically uses the current GitHub repository and release tag. No configuration needed! However, you can specify different values for more control.

```yaml
name: Notify pkg.go.dev on Release

on:
  release:
    types: [published]

jobs:
  notify:
    runs-on: ubuntu-latest

    steps:
      - name: Notify pkg.go.dev with release update
        uses: siyul-park/notify-pkg-go-dev@v1
```

## 🔧 How It Works

1. **Trigger**: When a new release is published in your repository, this action is triggered.
2. **Request**: The action sends a POST request to `pkg.go.dev` with the release information, updating the Go module registry.
3. **Easy Setup**: Simply add the action to your GitHub Workflow, and you’re done!

## 🤔 Why It’s Important

Keeping `pkg.go.dev` up-to-date with your latest release ensures that your Go module is easily accessible and discoverable by developers. This action automates the process, ensuring that your module is always available and reducing the manual effort required for updates.

## 🏆 Conclusion

With this action, you can automate the notification process to `pkg.go.dev` and ensure your Go module releases are always up-to-date. Simplify your release workflow and avoid missing updates by adding this action to your GitHub repository today!
