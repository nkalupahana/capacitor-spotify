# @getbaseline/capacitor-spotify

Native Spotify authentication for Capacitor.

## Install

```bash
npm install @getbaseline/capacitor-spotify
npx cap sync
```

## iOS Setup

1. Add a redirect URI to your app as a URL scheme. We recommend using reverse domain notation (e.g `app.getbaseline.baseline.spotify`).
2. Add the following to the beginning of `func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool` in `AppDelegate`:
```swift
if (url.scheme == "YOUR URL SCHEME FROM STEP 2 HERE <e.g. app.getbaseline.baseline.spotify>") {
    NotificationCenter.default.post(name: NSNotification.Name("spotifyLogin"), object: url);
}
```
3. Add the following to your app's `Info.plist` (allows your app to open the Spotify app for auth):
```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>spotify</string>
</array>
```

## API

<docgen-index>

* [`signIn(...)`](#signin)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### signIn(...)

```typescript
signIn(options: SignInOptions) => Promise<SignInResult>
```

| Param         | Type                                                    |
| ------------- | ------------------------------------------------------- |
| **`options`** | <code><a href="#signinoptions">SignInOptions</a></code> |

**Returns:** <code>Promise&lt;<a href="#signinresult">SignInResult</a>&gt;</code>

--------------------


### Interfaces


#### SignInResult

| Prop            | Type                |
| --------------- | ------------------- |
| **`resultUri`** | <code>string</code> |


#### SignInOptions

| Prop              | Type                |
| ----------------- | ------------------- |
| **`clientId`**    | <code>string</code> |
| **`redirectUri`** | <code>string</code> |

</docgen-api>
