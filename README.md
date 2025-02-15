***Update*** Use the js script instead, better solution, likely the way I did it "the first time" after much trial and error.
```
https://github.com/RedFoxAU/coose_icloudbookmarkclearer
```


# AutoHotKey_iCloudBMDeleter

www.icloud.com/recovery | Restore Book Marks | Auto mouse delete for when it has 10,000s in the bin

This is the second time my iCloud Bookmarks recycle bin has overfilled from a bookmark sync circle. Basically having many devices with Edge/FireFox/Chrome/Safari and the delete files sync back after been deleted from another device. This could simply be done by using iCloud for Windows and adding a browser with 10,000s of bookmarks. Each time you delete in an iOS/macOS it takes 30 days to clear the iCloud bin. If it overfills - iCloud bookmarks stops working.

If iCloud recovery is deleting 10 a time, and you have thousands...

I've previously had better success with <something else> which I have forgotten. It could have been in the Developer Tools, or on any OS or browser. This way here works, though it does need to be checked up on incase the browser has a memory error.


1. www.icloud.com/recovery
2. Restore Bookmarks
3. Select All
4. Install AHKv2
5. Validate X,Y,Colour values and update script (Window Spy in AHK2)
6. Run script to ensure values are left
7. Check occasionally to see if browser is still good.


Alternative solutions:
Log an Apple Ticket... I did this the first time, it took about 3 weeks before getting esculated - but by that stage I had deleted them by some automation way, possibly different to this as I had tried many ways.
Wait 30 days for iCloud to auto empty recyle.
Spend 1000s of hours try to figure it out
Spend 10,000s of hours doing it manually
