# WayScience GitHub Sandbox

**A place to mess around with git and GitHub**

## GitHub Tutorials

GitHub has a number of well documented tutorials and guides to help get setup.
Here are a few helpful links below:

|         Guide          | Link                                                                             |
| :--------------------: | -------------------------------------------------------------------------------- |
|   Create an Account    | https://help.github.com/articles/signing-up-for-a-new-github-account/            |
|  Enabling an SSH key   | https://help.github.com/articles/adding-a-new-ssh-key-to-your-github-account/    |
|    GitHub Workflow     | https://guides.github.com/introduction/flow/                                     |
| Setup command line git | http://dont-be-afraid-to-commit.readthedocs.io/en/latest/git/commandlinegit.html |
|  Markdown Cheatsheet   | https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet                 |

## Pull Request Model - Best Practices

Once done several times, the process becomes intuitive.
Described here is a walk through of how to contribute to an open source project and how collaborations on GitHub are best supported.
By the end of the walkthrough, you will have added your name and lab to a separate markdown file ([`students.md`](students.md)) using a pull request.

### Step 1 - Fork the Repository

Navigate to the WayScience/sandbox repository and click `Fork` above.

![fork](images/fork.png?raw=true)

This will create a copy of the sandbox repository under your username.

### Step 2 - Clone your Fork into your local machine

Navigate to your own fork of the WayScience/sandbox repository and clone with either `SSH` or `HTTPS`.
I typically use `SSH`, but this requires activating SSH keys.

![clone](images/clone.png?raw=true)

Copy the line and paste it into your terminal.

```sh
git clone git@github.com:<USERNAME>/sandbox.git
```

### Step 3 - Create a Branch

Branches are where all software development happens.
The `Master` branch is typically the front facing landing page of all GitHub repositories and stores cleanly written code, ready for viewing and/or production.
Other branches can be made that have other purposes, including development branches.
For our example here, we are adding your name and info to a GCB markdown table.

In the terminal (after navigating to the newly created `sandbox` directory (`cd sandbox`)), create and switch to a branch named `add-me`.

```sh
git checkout -b add-me
```

### Step 4 - Edit the Necessary Files

Now is when changes actually happen.
In your favorite text editor, add your information to the `students.md` file.
Once that is done, you can see explicitly which files have changed and what the changes are.

```sh
# Observe which files have changed
git status

# Observe what has changed
git diff students.md
```

### Step 5 - Add, Commit, and Push

This is the workhorse of git and are the most common commands.

```sh
# Tell git that you're adding this file - called "staging"
git add students.md

# Commit the actual change you're making - this will assign a unique hash to the change
# Add an informative message to the commit with `-m`
git commit -m 'adding my name to students.md'

# Push the change to your new branch
# This will fail at first!!!
git push
```

If you created a new branch, the push will fail because the `remote` GitHub server does not know about the branch.

```sh
# Tell it about the branch with:
# You only need to do this once
git push --set-upstream origin add-me
```

### Step 6 - File a Pull Request

The code is now living in your local machine and on your `fork`, but not in the WayScience repository.
Adding the code there is done through a pull request.

![pull_request](images/pull_request.png?raw=true)

This will bring you to the pull request screen.
Ensure the branches are correct, add a specific and descriptive message, and then file your pull request!
Note that the message you provided with the commit message is listed here.
All changes require a repository maintainer to take a look and eventually merge in.
Assign a maintainer to look, discuss, and eventually `merge` in your changes!

![pull_request_notes](images/pull_request_notes.png?raw=true)

### Step 7 - Reconfigure local machine and fork (IMPORTANT)

This is probably the most overlooked step of the pull request model: Ensuring the upstream branch, the fork, and your local machine are all at the same point.

```sh
# Initialize the upstream branch - this is the `WayScience/sandbox` repository that your fork is of
git remote add upstream git@github.com:WayScience/sandbox.git

# Check remote branches - the upstream branch should be configured now
git remote -v

# Switch your branch back to your master
git checkout master

# Fetch any changes from the upstream branch (from the `WayScience/sandbox`)
# This will include the newly merged pull request AND any other changes made by others
# This should be done periodically to ensure your origin is up to date with the upstream
git fetch upstream

# Merge upstream changes with your own
git merge upstream/master

# IMPORTANT - now the changes are on your local machine, but they are not yet on your remote GitHub repository!
# Change that simply with:
git push
```

### Step 8 - Repeat for any other change you want and that's it!

For major changes, it is often good practice to discuss a potential change by filing a [GitHub issue](https://github.com/WayScience/sandbox/issues) first.
