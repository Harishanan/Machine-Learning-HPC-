## Naming Convention for branches

When considering updates to the README file, it's essential to create a branch originating from the 'dev' branch. Before creating the branch, ensure that you've checked out the 'dev' branch and pulled the latest changes using the following Git commands:

```bash
git checkout dev
git pull origin dev
```

The naming convention for creating a branch focused on updating or adding to the README.md file is:

```bash
git checkout -b documentation/{branch_name}-{yourname}
```

If you're working on a new feature for the application, the recommended naming convention is:

```bash
git checkout -b feature/{branch_name}-{yourname}
```

Once you've completed your work in the respective branch, initiate a pull request with the following Git command:

```bash
git pull-request
```

Ensure to assign everyone from the team to the pull request, allowing for comprehensive feedback on your work. After receiving approval and addressing any necessary changes, the branch will be merged into the 'dev' branch. Subsequently, the 'dev' branch will be merged into the 'main' branch.

Remember to follow these procedures for efficient collaboration and version control in your Git workflow.
