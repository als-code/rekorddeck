# 03 — Make install media (Windows PC)

You need **two** media: **SteamOS Recovery** and **Windows installer**.

## Official Valve downloads

- [SteamOS Recovery image](https://help.steampowered.com/en/faqs/view/1B71-EDF2-EB8D-2BA0)  
- [Steam Deck Windows drivers](https://help.steampowered.com/en/faqs/view/6121-ECCD-D643-BAA8) (LCD or OLED — extract ZIPs)

Also get a **Windows 10/11 Pro** ISO from Microsoft / your legal channel.

Tool: [Rufus](https://rufus.ie/en/). Recovery is often a `.img` — in Rufus use **DD Image** mode when prompted (not a normal ISO write).

1. Download Recovery + drivers from the Valve links above, and your Windows ISO.  
2. Open Rufus → select the USB/SD → select the Recovery image → **Start**.  
3. Repeat with the second stick for the Windows ISO.  
4. Copy **extracted Valve drivers** onto the Windows USB in a folder.

## Check

- [ ] Recovery boots on the Deck (Vol− + Power)  
- [ ] Windows USB shows Microsoft setup  
- [ ] Valve driver folders on the Windows USB  

Next: [Prepare SteamOS](04-prepare-steamos.md).

Español: [../es/03-make-install-media.md](../es/03-make-install-media.md)
