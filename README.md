MXLInstallTracker
============

This is a small framework to make install attribution easy. At MobileX Labs we found ourselves wanting to track installs and ad campaign performance across a number of different providers in all of our apps. MXLInstallTracker makes that easy.

Installation
-----
MXLInstallTracker is now available via Cocoapods!

```
pod 'MXLInstallTracker', '~> 1.0.0'
```

Usage
-----
Just one call for the major networks.

```
[[MXLInstallTracker sharedManager] setUpWithGAKey:gameAnalyticsKey
                                         GAsecret:gameAnalyticsSecret
                                          GAbuild:@"0.1"
                                          MATAdID:@"yourID"
                                 MATConversionKey:@"yourKey"
                                   AWConversionID:@"yourAdwordsID"
                                          AWLabel:adwordsLabel];

```

Licence
-------
MIT. See LICENCE file for more info.

If you do use this in your app, send me a [tweet](http://twitter.com/k_panesar)!