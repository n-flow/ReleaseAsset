# ReleaseAsset

* [Sample Configuration](#sample-configuration)

## Sample Configuration
```yml
on:
  release:
    types: [published]
name: Handle Release
jobs:
  generate:
    name: Create build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout the code
        uses: actions/checkout@v2

      - name: Setup Java 11 Environment
        uses: actions/setup-java@v1
        with:
          java-version: 11

      - name: Update Permission for gradle
        run: chmod +x gradlew

      - name: Build APK
        run: ./gradlew clean assembleQa

      - name: Upload to release asset
        uses: n-flow/ReleaseAsset@main
        id: attach_to_release
        env:
          GITHUB_TOKEN: ${{ secrets.GIT_ACCESS_TOKEN }}
        with:
          args: "app/build/outputs/apk/qa/*.apk"
```