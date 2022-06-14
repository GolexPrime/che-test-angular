schemaVersion: 2.1.0
metadata:
  description: Stack with Angular 12
  displayName: Angular
  icon: https://raw.githubusercontent.com/devfile-samples/devfile-stack-icons/main/angular.svg
  language: typescript
  name: nodejs-angular
  projectType: angular
  tags:
    - NodeJS
    - Angular
  version: 1.0.1
starterProjects:
  - name: nodejs-angular-starter
    git:
      checkoutFrom:
        revision: main
      remotes:
        origin: https://github.com/devfile-samples/devfile-stack-nodejs-angular.git
components:
  - container:
      endpoints:
        - name: http
          targetPort: 4200
      image: node:lts-slim
      memoryLimit: 1024Mi
    name: runtime
commands:
  - exec:
      commandLine: yarn install
      component: runtime
      group:
        isDefault: true
        kind: build
      workingDir: ${PROJECT_SOURCE}
    id: install
  - exec:
      commandLine: yarn start
      component: runtime
      group:
        isDefault: true
        kind: run
      hotReloadCapable: true
      workingDir: ${PROJECT_SOURCE}
    id: run