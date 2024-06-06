import { WebPlugin } from '@capacitor/core';

import type { SignInOptions, SignInResult, SpotifyPlugin } from './definitions';

export class SpotifyWeb extends WebPlugin implements SpotifyPlugin {
  async signIn(_: SignInOptions): Promise<SignInResult> {
    console.log("unimplemented on web")
    return {
      resultUri: "unimplemented on web"
    }
  }
}
