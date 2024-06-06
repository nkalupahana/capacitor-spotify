import Foundation
import Capacitor

@objc(SpotifyPlugin)
public class SpotifyPlugin: CAPPlugin {
    var lastCall: CAPPluginCall?
    
    @objc func spotifyLogin(notification: Notification) {
        let url = notification.object as! URL;
        print(url)
        lastCall?.resolve([
            "resultUri": url.absoluteString
        ])
    }
    
    @objc func signIn(_ call: CAPPluginCall) {
        guard let clientId = call.getString("clientId") else {
            return call.reject("A client ID must be provided!")
        }
        
        guard let redirectUriStr = call.getString("redirectUri") else {
            return call.reject("Redirect URI must be set!")
        }
        
        guard let redirectUri = URL(string:redirectUriStr) else {
            return call.reject("Redirect URI not valid URI!")
        }
        
        let configuration = SPTConfiguration(clientID: clientId, redirectURL: redirectUri);
        let manager = SPTSessionManager(configuration: configuration, delegate: nil)
        
        lastCall = call
        
        NotificationCenter.default.addObserver(self, selector: #selector(SpotifyPlugin.spotifyLogin), name: Notification.Name("spotifyLogin"), object: nil)
        
        DispatchQueue.main.sync {
            manager.initiateSession(with: [.userReadCurrentlyPlaying, .userLibraryRead, .userReadRecentlyPlayed, .userTopRead])
        }
    }
    
    static public func accessTheseNuts() {
        print("accessed nuts")
    }
}
