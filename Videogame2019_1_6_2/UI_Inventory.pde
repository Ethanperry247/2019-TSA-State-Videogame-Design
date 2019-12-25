public class Inventory //Main class that initializes everything
{
  private boolean isActive; //keeps track of if the inventory can display and run code

  //Display
  private float xPos;
  private float yPos;
  private float leng;
  private float wid;
  private PImage screen; //added in 6.0

  //Items
  private ArrayList<Item> Items = new ArrayList<Item>();
  private boolean holding = false;

  //Slots
  private Slot[][] slots;

  private Slot[] equipSlots;

  private Slot[] docSlots;

  //Stats
  private PlayerStats player;

  //Status Bars
  private Bar health;
  private Bar stamina;

  //Header
  private String header;

  public Inventory(PlayerStats p)
  {
    xPos = 40;
    yPos = 40;
    leng = 1200;
    wid = 640;
    
    screen = inventoryBack; //added in 6.0

    player = p;

    header = player.getPlayerName() + ", LVL " + player.getLevel() + " " + player.getClassName();

    health = new Bar(90, 199, 276, 27, "HP", player.getHealth(), player.getMaxHealth(), #34CE3D, 15);
    stamina = new Bar(90, 266, 276, 27, "SP", player.getStamina(), player.getMaxStamina(), #9229A2, 13);

    slots = new Slot[4][2];

    equipSlots = new Slot[2];
    equipSlots[0] = new Slot(516, 82, 100, 95, "helm", true);
    equipSlots[1] = new Slot(444, 362, 82, 78, "weapon", true);

    docSlots = new Slot[4];
    for (int i = 0; i< docSlots.length; i++)
    {
      docSlots[i] = new Slot(732 + (115*i), 517, 105, 101, "doc");
    }

    for (int i = 0; i < slots.length; i++)
    {
      for (int k = 0; k< slots[i].length; k++)
      {
        slots[i][k] = new Slot(729+(115*i), 149+(108*k), 107, 101, "basic");
      }
    }
  }

  void display() //Displays inventory screen and all subelements, acts as the inventory's runner
  {
    if (isActive)
    {
      image(screen, xPos, yPos, leng, wid);

      updateMisc();

      health.display();
      stamina.display();

      for (Slot[] slot : slots)
      {
        for (Slot s : slot)
        {
          s.display();
        }
      }
      for (Slot s : equipSlots)
      {
        s.display();
      }

      for (Slot s : docSlots)
      {
        s.display();
      }

      for (Item i : Items)
      {
        i.display();
      }



      //fill(0);
      //text(header, 50, 60);
      //fill(255);
    }
  }
  void updateMisc() //Updates level, modifiers, class, item position, and status bars.
  {
    if (isActive)
    {
      header = player.getPlayerName() + ", LVL " + player.getLevel() + " " + player.getClassName();

      health.setStat(player.getHealth());
      health.setMaxStat(player.getMaxHealth());

      stamina.setStat(player.getStamina());
      stamina.setMaxStat(player.getMaxStamina());


      for (Item i : Items)
      {
        i.updatePos();
      }

      float tempHMod = 0;
      float tempDMod = 0;
      float tempAMod = 0;




      for (Slot[] slot : slots) //Updates the contents of all slots... fixes a bug with the drop down menu, could cause lag...
      {
        for (Slot s : slot)
        {
          s.updateContents();
        }
      }

      for (Slot s : docSlots) //Same as above, but for docSlots
      {
        s.updateContents();
      }



      for (Slot s : equipSlots) //Equipment modifiers
      { 
        s.updateContents();
        Item temp = s.getItem();
        if (temp != null)
        {
          tempHMod += temp.getHealthMod();
          tempDMod += temp.getDefenseMod();
          tempAMod += temp.getAttackMod();
        }
      }

      player.setModifiers(tempHMod, tempDMod, tempAMod);
    }
  }

  void addItem(Item i) //adds an item to the next available slot of the inventory
  {
    Items.add(i);
    boolean placed = false;

    for (Slot s : docSlots) //puts docs in docs by default
    {
      if (!s.hasItem() && i.getType() == "doc")

      {
        if (!placed)
        {
          s.setContents(i);
          i.resize(s.getLeng()-10, s.getWid()-10);
          i.store(s.getLeng()-10, s.getWid()-10);
          i.snap(s.getX()+5, s.getY()+5);
          placed = true;
        }
      }
    }



 if(!(i.getType() == "doc"))
 {

    //Used to put items in slots in a certain way, broke once it was no longer a square. Fixed it, but haven't changed this back to an enhanced loop.
    for (int p = 0; p < slots.length; p++) //puts all other items in the first available basic slot
    {
      for (int k = 0; k < slots[p].length; k++)
      {
        if (!slots[p][k].hasItem())
        {
          if (!placed)
          {
            slots[p][k].setContents(i);
            i.resize(slots[p][k].getLeng()-10, slots[p][k].getWid()-10);
            i.store(slots[p][k].getLeng()-10, slots[p][k].getWid()-10);
            i.snap(slots[p][k].getX()+5, slots[p][k].getY()+5);
            placed = true;
          }
        }
      }
    }
 }
  }

  void removeItem(Item i)
  {
    Items.remove(i); //remove item

    i.snap(0, 0); //move it to nowhere


    for (Slot[] slot : slots) //Update the slot containing it
    {
      for (Slot s : slot)
      {
        if (s.getItem() == i)
        {
          s.updateContents();
        }
      }
    }
    for (Slot s : equipSlots)
    {
      if (s.getItem() == i)
      {
        s.updateContents();
      }
    }

    for (Slot s : docSlots)
    {
      if (s.getItem() == i)
      {
        s.updateContents();
      }
    }
  }

  void consumeItem(Item i)
  {
    if (i != null)
    {
      player.setHealth(player.getHealth() + i.getHealthAdd());
      if (player.getHealth() > player.getMaxHealth())
      {
        player.setHealth(player.getMaxHealth());
      }
      player.setStamina(player.getStamina() + i.getStaminaAdd());
      if (player.getStamina() > player.getMaxStamina())
      {
        player.setStamina(player.getMaxStamina());
      }
      removeItem(i);
    }
  }



  void setClicked() //Bridges the gap from inventory click input to slot click input
  {
    if (isActive)
    {
      for (Slot[] slot : slots)
      {
        for (Slot s : slot)
        {
          s.isClicked();
        }
      }
      for (Slot s : equipSlots)
      {
        s.isClicked();
      }
      for (Slot s : docSlots)
      {
        s.isClicked();
      }
    }
  }

  void setPressed() //Bridges the gap between inventory press input and item input
  {
    if (isActive)
    {
      for (Item i : Items)
      {
        if (i.isHovered() && !holding && mouseButton == LEFT)
        {
          i.isPressed();
          i.resize(50, 50);
          holding = true;
        }
      }
    }
  }

  void setReleased() //Holy baloney... so basically, this looks at all the slots and sees if the user is hovering over them. It then sees if the user is holding an item, and if both are true, puts the item in the slot. Also checks if the slot is already filled.
  {
    if (isActive)
    {
      Slot tempslot = null;
      Boolean temp = false;

      for (Slot[] slot : slots)
      {
        for (Slot s : slot)
        {
          if (s.isHovered()) //check slot
          {
            tempslot = s;
            temp = true;
            s.updateContents();
          }
        }
      }

      for (Slot s : equipSlots)
      {
        if (s.isHovered()) //check slot
        {
          tempslot = s;
          temp = true;
          s.updateContents();
        }
      }

      for (Slot s : docSlots)
      {
        if (s.isHovered()) //check slot
        {
          tempslot = s;
          temp = true;
          s.updateContents();
        }
      }

      for (Item i : Items)
      {
        if (temp && i.getHeld() == true)
        {
          //debug
          //print (i.getType() + " " + tempslot.getType() + "\n");
          if ((!tempslot.hasItem() || i == tempslot.getItem()) && (i.getType() == tempslot.getType() || tempslot.getType() == "basic")) //put item in slot
          {
            i.release();
            tempslot.setContents(i);
            i.setSlot(tempslot);
            i.resize(tempslot.getLeng()-10, tempslot.getWid()-10);
            i.store(tempslot.getLeng()-10, tempslot.getWid()-10);
            i.snap(tempslot.getX()+5, tempslot.getY()+5);
            temp = false;
            holding = false;
          }
        }
        if ((!temp || tempslot.hasItem()) || !(i.getType() == tempslot.getType() || tempslot.getType() == "basic")) //don't
        {
          i.release();
          i.reset();
          holding = false;
          if (i.getSlot() != null) //added code to have equipped items remind the slot they snap back into that they still occupy it
          {
            i.getSlot().setContents(i);
          }
        }
      }
    }
  }

  void setActive(boolean t) //Sets everything in the inventory's domain to active or inactive
  {
    isActive = t;

    for (Slot[] slot : slots)
    {
      for (Slot s : slot)
      {
        s.setActive(t);
      }
    }
    for (Slot s : equipSlots)
    {
      s.setActive(t);
    }

    for (Slot s : docSlots)
    {
      s.setActive(t);
    }

    health.setActive(t);
    stamina.setActive(t);
  }
  
  void setImage(PImage p) //added in 6.0
  {
    screen = p;
  }

  boolean getActive()
  {
    return isActive;
  }

  ArrayList<Item> getItems()
  {
    return Items;
  }

  float getX()
  {
    return xPos;
  }

  float getY()
  {
    return yPos;
  }

  float getLeng()
  {
    return leng;
  }

  float getWid()
  {
    return wid;
  }
}

//------------------------------------------------------------------

public class Slot //Inventory slots & equipment slots
{
  private boolean isActive;

  private String slotType;

  //Display
  private float xPos;
  private float yPos;
  private float leng;
  private float wid;

  //Drop Down Display
  private boolean dropDown;

  //Contents
  private Item item = null;
  private boolean hasItem = false;
  private boolean transparent = false;

  public Slot(float x, float y, float l, float w, String s)
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;
    slotType = s;
  }

  public Slot(float x, float y, float l, float w, String s, boolean b)
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;
    slotType = s;

    transparent = b;
  }

  void display()
  {
    if (isActive)
    {
      if (!transparent)
      {
        if (this.isHovered())
        {
          stroke(255);
          strokeWeight(3);
          fill(100);
        } else
        {
          stroke(255);
          strokeWeight(3);
          fill(190);
        }
        rect(xPos, yPos, leng, wid);
        fill(255);



        stroke(0);
        strokeWeight(1);
      }

      if (transparent)
      {
        image(transparentSlot, xPos, yPos, leng, wid);
      }

      if (this.isHovered() && dropDown) //Dropdown menu
      {
        if (item != null)
        {
          item.setHidden(true); //redundant call to fix equipment slots... can't find where the bug originates but this fixes it?

          rect(xPos, yPos, leng, wid);
        }

        if (item != null && item.getType() == "helm") //helmet drop down logic
        {
          fill(0);
          textSize(12);
          text(item.getName(), xPos+5, yPos+11);
          text("Helmet:", xPos+5, yPos+26);
          text("When equipped", xPos+5, yPos+40);
          text("it provides:", xPos+5, yPos+50);

          String temp = "";
          if (item.getHealthMod() > 0)
          {
            temp += "+" + item.getHealthMod()+ " health\n";
          }
          if (item.getDefenseMod() > 0)
          {
            temp += "+" + item.getDefenseMod()+ " defense\n";
          }
          if (item.getAttackMod() > 0)
          {
            temp += "+" + item.getAttackMod()+ " attack\n";
          }

          text(temp, xPos+5, yPos+65);
        }

        if (item != null && item.getType() == "weapon") //weapon drop down logic
        {
          fill(0);
          textSize(12);
          text(item.getName(), xPos+5, yPos+11);
          text("Weapon:", xPos+5, yPos+26);
          text("When held", xPos+5, yPos+40);
          text("it provides:", xPos+5, yPos+50);

          String temp = "";
          if (item.getHealthMod() > 0)
          {
            temp += "+" + item.getHealthMod()+ " health\n";
          }
          if (item.getDefenseMod() > 0)
          {
            temp += "+" + item.getDefenseMod()+ " defense\n";
          }
          if (item.getAttackMod() > 0)
          {
            temp += "+" + item.getAttackMod()+ " attack\n";
          }

          text(temp, xPos+5, yPos+65);
          fill(255);
        }

        if (item != null && item.getType() == "doc") //document drop down logic
        {
        
          fill(0);
          textSize(12);
          text(item.getName(), xPos+5, yPos+11);
          text("Document:", xPos+5, yPos+26);
          text("You need this", xPos+5, yPos+40);
          text("to not be", xPos+5, yPos+50);
          text("disqualified...", xPos+5, yPos+60);
          fill(255);
        }

        if (item != null && item.getConsumable() == true) //consumable drop down logic
        {
          fill(0);
          textSize(12);
          text(item.getName(), xPos+5, yPos+11);
          text("Consumable:", xPos+5, yPos+26);
          text("When used", xPos+5, yPos+40);
          text("it restores:", xPos+5, yPos+50);

          String temp = "";
          if (item.getHealthAdd() > 0)
          {
            temp += item.getHealthAdd()+ " health\n";
          }
          if (item.getStaminaAdd() > 0)
          {
            temp += item.getStaminaAdd()+ " stamina\n";
          }
          text(temp, xPos+5, yPos+65);
          fill(255);
        }
      }
    }
  }

  boolean isHovered()
  {
    if (mouseX > xPos && mouseY > yPos && mouseX < xPos + leng && mouseY < yPos+wid)
    {
      //print("contains " + item + "\n");
      return true;
    }
    dropDown = false;

    if (item != null)
    {
      item.setHidden(false);
    }

    return false;
  }

  void isClicked()
  {
    if (isHovered() && mouseButton == RIGHT)
    {
      {
        dropDown = true;

        //debug
        //print(item + "\n");

        if (item != null)
        {
          item.setHidden(true);
        }
      }
      //print("I've been clicked " + slotType +"\n");
    }
  }

  void setContents(Item i) //tells the slot it has this item
  {
    item = i;
    //print("set contents to " + i + "\n");
    hasItem = true;
  }

  void updateContents() //if the item it had is no longer in the slot, it opens itself to input
  {
    if (item != null)
    {
      if (item.getX() != xPos + 5 || item.getY() != yPos + 5)
      {
        hasItem = false;
        item = null;
      }
    }

    if (item == null)
    {
      hasItem = false;
    }
  }

  boolean hasItem()
  {
    return hasItem;
  }

  Item getItem()
  {
    return item;
  }

  void setActive(boolean t)
  {
    isActive = t;
  }

  boolean getActive()
  {
    return isActive;
  }

  String getType()
  {
    return slotType;
  }

  float getX()
  {
    return xPos;
  }

  float getY()
  {
    return yPos;
  }

  float getLeng()
  {
    return leng;
  }

  float getWid()
  {
    return wid;
  }
}

//------------------------------------------------------------------

public class Bar
{
  private boolean isActive;

  //Display
  private float xPos;
  private float yPos;
  private float leng;
  private float wid;

  private float yTxtOff;

  private String statName;
  private float stat;
  private float maxStat;
  private color statColor;
  
  private boolean cool;

  public Bar(float x, float y, float l, float w, String sn, float s, float ms, color c, float yx)
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;

    statName = sn;
    stat = s;
    maxStat = ms;
    statColor = c;

    yTxtOff = yx;
  }
  
  public Bar(float x, float y, float l, float w, String sn, float s, float ms, color c, float yx, boolean thisshitcooldawg)
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;

    statName = sn;
    stat = s;
    maxStat = ms;
    statColor = c;

    yTxtOff = yx;
    
    cool = thisshitcooldawg;
  }

  void display()
  {
    if (isActive && !cool)
    {
      fill(255);
      rect(xPos, yPos, leng, wid);
      fill(statColor);
      rect(xPos, yPos, leng*(stat/maxStat), wid);
      fill(255);
      textSize(25);
      text((int)stat + "/" + (int)maxStat, xPos+(54), yPos-(yTxtOff));
      textSize(1);
    }
    
    if (isActive && cool)
    {
      screenI.fill(255);
      screenI.rect(xPos, yPos, leng, wid);
      screenI.fill(statColor);
      screenI.rect(xPos, yPos, leng*(stat/maxStat), wid);
      screenI.fill(255);
      screenI.textSize(25);
      screenI.text(statName + " ", xPos+5, yPos-(yTxtOff));
      screenI.text((int)stat + "/" + (int)maxStat, xPos+(50), yPos-(yTxtOff));
      screenI.textSize(1);
    }
  }

  void setStatName(String s)
  {
    statName = s;
  }

  void setStat(float s)
  {
    stat = s;
  }

  void setMaxStat(float s)
  {
    maxStat = s;
  }

  void setActive(boolean t)
  {
    isActive = t;
  }

  boolean getActive()
  {
    return isActive;
  }
}

//------------------------------------------------------------------

void inventoryKeyPress() //handles key input for inventory
{
  if (key == 'i' || key == 'I') 
  {
    if (!main.getActive())
    {
      main.setActive(true);
    } else if (main.getActive())
    {
      main.setActive(false);
      main.setReleased();
    }
  }
}

void inventorySlotInput()
{
  main.setClicked();
}

void inventoryItemInput()
{
  main.setPressed();
}

void inventoryItemInputEnd()
{
  main.setReleased();
}
