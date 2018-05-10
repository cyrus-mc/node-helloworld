# KOA Hello World

### Prerequisites

The following tools are required

Docker:

  - [Community Edition for Mac](https://download.docker.com/mac/stable/Docker.dmg)
  - [Community Edition for Windows](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

Visual Studio Code:

   - [Mac](https://go.microsoft.com/fwlink/?LinkID=534106)
   - [Windows](https://go.microsoft.com/fwlink/?LinkID=534107)

### Running from the CLI

To start a local server, without remote debugging enabled:

  - `npm run compose:up`

You should now be able to hit the service via http://localhost:3000.

To shutdown the service execute:

  - `npm run compose:down`

#### Remote Debugging

To start a local service, with remote debugging and the ability to edit code on the fly, execute:

   - `npm run compose:dev`

You should now be able to hit the service via http://localhost:3000. In addition, the inspector port is accessible via port 9222. Any changes to source will be reflected live in the running container.

To shutdown the service execute:

   - `npm run compose:down:dev`

#### UNIT Tests

To execute UNIT tests, execute:

   - `npm run compose:test`
