# cosign-workflow-template

A repository for possible templates for including the keyless procedure of signing Entando's images in Docker Hub after the publication using cosign.

## Description

The workflows build the Docker image and then push it to the Docker Hub repository. Afterwards, they verify the cosign signature for each of the pushed tags.
When the images are signed, a tag based on the digest of the image is also pushed to the repository.

For example, if an image with digest `sha256:eab9c6e2827564fa615af8b45bd08baa987ab0d4fbb612ae27e7866ded4fbfc5` is signed with the keyless procedure with cosign, then a tag in the repository with the name `sha256-eab9c6e2827564fa615af8b45bd08baa987ab0d4fbb612ae27e7866ded4fbfc5.sig` will be pushed as well.

The command to verify an image with cosign is:

`cosign verify [ORGANIZATION]/[REPOSITORY]:[TAG] --certificate-identity=[CERTIFICATE_IDENTITY] --certificate-oidc-issuer=[CERTIFICATE_OIDC_ISSUER]`

In the case of keyless signing with cosign in Github actions, the Certificate Identity will be `https://github.com/${WORKFLOW_REF}` based on the ref of the workflow (e.g.: `https://github.com/riccardo-fadda/cosign-workflow-template/.github/workflows/publication.yml@refs/heads/main`) and the Certificate OIDC Issuer will be `https://token.actions.githubusercontent.com`.