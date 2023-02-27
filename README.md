# python-copier-template
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/myrontuttle/python-copier-template)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/myrontuttle/python-copier-template/ci.yml)

## What is this?

This project template codifies my best practices for python code organization, testing, documentation, and automation. It is meant to help new python projects get started quickly, letting the user focus on writing code. 

# Getting started

## Prerequisites

These prerequisites for Copier are defined [here](https://copier.readthedocs.io/en/latest/#installation).
1) Python > 3.7
2) Git > 2.27
3) pipx (nice to have, conda and pip work too, but can be more difficult to reason about later)

## Install Copier

Given that you have all the prerequisites satisfied, install Copier.
```
>> pipx install copier
```

## Create a new project from the template

Choose where you would like to create your new project and call copier with the template.
```
>> copier gh:myrontuttle/python-copier-template <path/to/destination>
```

After providing answers to the prompts, Copier will hydrate a project template and save it in the specified location. Additionally Copier will run `git init` in the new project directory to initialize it as a local repository.

# Python Project Features

At this point, your new project is hydrated and ready for you to start coding. But there's a lot more that this template has to offer. 
- [PDM](https://github.com/pdm-project/pdm) setup, with pre-defined `pyproject.toml`
    - Install dependencies
```
pdm add requests flask
```
You can add multiple dependencies in the same command. You can check the pdm.lock file to see what is locked for each package.
- Pre-configured tools for code formatting, quality analysis and testing:
    - [black](https://github.com/psf/black)
    - [ruff](https://github.com/charliermarsh/ruff)
    - [isort](https://github.com/timothycrosley/isort)
    - [mypy](https://github.com/python/mypy)
    - [bandit](https://github.com/pyupio/bandit)
	- [pre-commit] (https://pre-commit.com/)
	- [pytest](https://github.com/pytest-dev/pytest) and plugins, with [coverage](https://github.com/nedbat/coveragepy)
- Makefile for convenience
- GitHub Actions (CI)
	- Dependabot to check for dependency updates weekly
	- Auto-approve-and-merge to approve and merge pr's raised by dependabot if all quality checks and tests pass
	- Build to build and test your project
	- Publish-to-pypi to publish library releases

## Commit your new project locally

After creating the project files, copier commits the project to the _local_ version control like so with pre-commit checks run.

```
>> git checkout -b initial_branch
Switched to a new branch 'initial_branch'
>> git add .
>> git commit -m 'Initial commit'
```

## Push your work to GitHub

Create a new repository in GitHub: ([GitHub How-to](https://docs.github.com/en/get-started/quickstart/create-a-repo))

```
>> git remote add origin https://github.com/<the_remote_project>/<the_remote_repository>
>> git push origin <local_branch_name>
```

Notice that when you create a PR in GitHub, a set of tests for Continuous Integration starts up to verify that the project can build successfully and that all the unit tests pass. 

## GitHub CI is ready out of the box

Notice that this template contains a `.github/workflows` directory with actions files. Any project created from this template that uses GitHub as a repository will automatically have CI enabled.

GitHub workflows are extremely useful, for more information, check out the [About workflows](https://docs.github.com/en/actions/using-workflows/about-workflows) page.

## Unit test coverage

The GitHub workflow that runs when a new commit is pushed to a pull request, will automatically run unit tests and output code coverage into an xml file. To easily see if code coverage is changing as a result of new work, you should install the GitHub app, Codecov.

- Go to the Codecov app page - https://github.com/apps/codecov
- Click "Configure"
- Select your repository and follow the instructions

Future pull requests and commits will now include code coverage information.

## Automatic publishing to ReadTheDocs

If you have connected your GitHub account to [ReadTheDocs](https://readthedocs.org/) you should be able to automatically import the documentation from your project. To connect your GitHub account to ReadTheDocs, simply sign in to ReadTheDocs using your GitHub account.

On your dashboard, you'll see an "Import a Project" button that will take you to a list of repositories that can be [automatically imported](https://docs.readthedocs.io/en/stable/intro/import-guide.html#automatically-import-your-docs). If you don't see the repository you expect, it is possible that you do not have sufficient permissions configured in your GitHub organization. Talk to an administrator of the organization, and let them know what you're trying to do.

## Publishing to PyPI

A GitHub workflow is included that will automatically publish the packaged work to [PyPI](https://pypi.org/) when a new release is created. To support this, you'll need to configure your repository.

- Create and verify an account on PyPI - https://pypi.org/account/register/
- Create a PyPI API token - https://pypi.org/help/#apitoken
- Save the API token in your new repository following [these instructions](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-encrypted-secrets-for-your-repository-and-organization-for-github-codespaces#adding-secrets-for-a-repository). Save your secret API token with the name: PYPI_API_TOKEN

Now, when you [create a new release](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release) from your repository, a workflow will run that will package and deploy the code to PyPI.

## Keep your project up to date as the original template evolves

Once your project is under version control you'll be able to keep your project up to date by running `copier update`.

Copier will automatically check to see if a newer version of the original template is available and if so the changes will be automatically applied. 

And of course, because your project is under version control, if you don't like the new changes, you can always revert back to the previous state. :grinning:

# Contributing to the Template

[![GitHub issue custom search in repo](https://img.shields.io/github/issues-search/myrontuttle/python-copier-template?color=purple&label=Good%20first%20issues&query=is%3Aopen%20label%3A%22good%20first%20issue%22)](https://github.com/myrontuttle/python-copier-template/issues?q=is%3Aissue+is%3Aopen+label%3A%22good+first+issue%22)

## Find (or make) a new GitHub issue

Add yourself as the assignee on an existing issue so that we know who's working on what. ( If you're not actively working on an issue, unassign yourself :wink: ) 

If there isn't an issue for the work you want to do, please create one and include a description - it's just polite.

## Create a branch

It is preferable that you create a new branch with a name like `issue/##/<short-description>`. GitHub makes it pretty easy to associate branches and tickets, but it's nice when it's in the name.

## Testing the template

The current best way to test the template is to clone this repository locally, and use Copier to generate a test project locally, then verify your expected results.

Copier will look for git tags to determine which version of the template to use. You probably don't want to create new tags while you're working on the template. Create a test project using the following command to let Copier know to use the latest local version. 
```
>> copier --vcs-ref HEAD </local/path/to/template> </test/project/directory>
```
Notes:
1) Any changes to the template will need to be committed (**not pushed**) to be picked up by Copier.
2) If there's an opportunity for introducing an automated test, please take it.
3) This project has some automated testing, to ensure that the template can hydrate a reasonable output project - feel free to extend that if it's reasonable.
4) See the [Copier documentation](https://copier.readthedocs.io/en/latest/generating/#regenerating-a-project) for more information.

## Create your PR

Please use PR best practices, and get someone to review your code.

## Optional - Release a new version

Once your PR is merged you should create a new release to make your changes available. GitHub's [instructions](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) for doing so are here. Use your best judgement when incrementing the version. i.e. is this a major, minor, or patch fix.

# Credits
This project is based on [copier-pdm](https://github.com/pawamoy/copier-pdm) and [python-project-template](https://github.com/lincc-frameworks/python-project-template).

# License
This project is open sourced under MIT license, see the [LICENSE](https://github.com/myrontuttle/python-copier-template/LICENSE) file for more details.
