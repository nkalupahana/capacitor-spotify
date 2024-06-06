export interface SpotifyPlugin {
  signIn(options: SignInOptions): Promise<SignInResult>;
}

export interface SignInOptions {
  clientId: string;
  redirectUri: string;
}

export interface SignInResult {
  resultUri: string;
}