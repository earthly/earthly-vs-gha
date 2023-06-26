
# Earthly and Github Actions

This is a repository for Earthly's article on Github Actions and Earthly.

## Running Locally

### Prequisites

- Earthly - if Earthly is not installed, [get Earthly](https://earthly.dev/get-earthly).

### Running the build

After cloning this repository, navigate to the root directory and run:

```
earthly +main-pipeline --tag=local
```

The `--tag` argument is appended to the images that get built locally. It can be any valid string that Docker image tags support.

### Running the app locally

After you've built the images, you can run the app locally by running:

```
earthly +dev-up --tag=local
```

Then, open http://localhost:3001 in your browser.

### Stop the app locally

Hit `ctrl+c` in your terminal or alternatively, run `earthly +dev-down`.


# Running on Github Actions

There are 2 Github Actions workflows provided in the `.github/workflows` directory. 

- `ci-actions-only.yml` - This workflow runs the build on Github Actions *only* using Docker and a combination of GHA plugins.
- `ci-satellites.yml` - This workflow runs the build on an Earthly Satellite (remote runner) via Github Actions.

In order for these workflows to work in your own repository, you will need to create 5 repository secrets which are used as environment variables in the workflows:

- `DOCKERHUB_USERNAME` - Your Docker Hub username.
- `DOCKERHUB_TOKEN` - Your Docker Hub token.
- `EARTHLY_TOKEN` - Your Earthly token.
- `EARTHLY_ORG` - The name of your Earthly org where your satellite was created.
- `SATELLITE_NAME` - The name of your Earthly satellite

To get access to an Earthly Satellite, sign up for Earthly Free Tier at ...



