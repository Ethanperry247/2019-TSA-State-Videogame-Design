public class Item
{
  //Display
  private String itemName;
  private PImage icon;
  private float xPos;
  private float yPos;
  private float leng;
  private float wid;

  //Bounds
  private float invXPos;
  private float invYPos;
  private float invLeng;
  private float invWid;

  //Logic
  private boolean held;
  private String itemType;
  private boolean consumable;
  private float wasSnappedX = 0;
  private float wasSnappedY = 0;
  private float wasResizedLeng = 50;
  private float wasResizedWid = 50;
  private Slot heldIn;
  private boolean isHidden;

  //Modifiers
  private float healthMod;
  private float defenseMod;
  private float attackMod;

  //Consumable Modifiers
  private float addedHealth;
  private float addedStamina;


  public Item(PImage i, String n, String t, float h, float d, float a) //Item with equipment modifiers 
  {
    icon = i;
    itemName = n;
    itemType = t;

    healthMod = h;
    defenseMod = d;
    attackMod = a;

    invXPos = main.getX();
    invYPos = main.getY();
    invLeng = main.getLeng();
    invWid = main.getWid();
  }

  public Item(PImage i, String n, String t, float h, float s, boolean c) //Consumable item
  {
    icon = i;
    itemName = n;
    itemType = t;

    addedHealth = h;
    addedStamina = s;

    consumable = c;

    invXPos = main.getX();
    invYPos = main.getY();
    invLeng = main.getLeng();
    invWid = main.getWid();
  }

  public Item(PImage i, String n, String t) //Item without modifiers
  {
    icon = i;
    itemName = n;
    itemType = t;

    invXPos = main.getX();
    invYPos = main.getY();
    invLeng = main.getLeng();
    invWid = main.getWid();
  }

  void display()
  { 
    //debug
    /*
    if(isHidden)
     {
     print("hiding \n");
     }
     */



    if (!isHidden)
    {

      image(icon, xPos, yPos, leng, wid);
      //debug
      //print ("showing \n");
      /*
      fill(0);
       textSize(25);
       text(itemType, xPos+20, yPos+20);
       fill(255);
       */
    }
  } 

  void updatePos()
  { 
    if (held)
    {
      xPos = mouseX-(leng/2);
      yPos = mouseY-(wid/2);
    }
    if (xPos < invXPos)
    {
      xPos = invXPos;
    }
    if (yPos < invYPos)
    {
      yPos = invYPos;
    }
    if (xPos + leng > invXPos + invLeng)
    {
      xPos = invXPos+invLeng-leng;
    }
    if (yPos + wid > invYPos + invWid)
    {
      yPos = invYPos+invWid-wid;
    }
  }

  boolean isHovered()
  { 
    if ((mouseX > xPos && mouseY > yPos && mouseX < xPos + leng && mouseY < yPos+wid)& !isHidden)
    {
      return true;
    }

    return false;
  }

  void isPressed()
  {
    if (mouseButton != RIGHT)
    {
      if (isHovered() && mouseButton == LEFT && !isHidden)
      {
        //print("I've been pressed " + itemType +"\n");
        held = true;
        thunk.rewind();
        thunk.play();
      }
    }
  }

  void release()
  {
    held = false;
    thunk.rewind();
    thunk.play();
  }

  void snap(float x, float y)
  {
    xPos = x;
    yPos = y;
    wasSnappedX = x;
    wasSnappedY = y;
  }

  void reset()
  {
    xPos = wasSnappedX;
    yPos = wasSnappedY;
    leng = wasResizedLeng;
    wid = wasResizedWid;
  }

  void store(float l, float w)
  {
    wasResizedWid = w;
    wasResizedLeng = l;
  }

  void resize(float l, float w)
  {
    leng = l;
    wid = w;
  }

  boolean getHeld()
  {
    return held;
  }

  boolean getConsumable()
  {
    return consumable;
  }

  String getName()
  {
    return itemName;
  }

  String getType()
  {
    return itemType;
  }

  float getX()
  {
    return xPos;
  }

  float getY()
  {
    return yPos;
  }

  float getHealthMod()
  {
    return healthMod;
  }

  float getDefenseMod()
  {
    return defenseMod;
  }

  float getAttackMod()
  {
    return attackMod;
  }

  float getHealthAdd()
  {
    return addedHealth;
  }

  float getStaminaAdd()
  {
    return addedStamina;
  }

  Slot getSlot()
  {
    return heldIn;
  }

  void setSlot(Slot s)
  {
    heldIn = s;
  }

  void setHidden(boolean b)
  {
    //debug
    /*
    if (b == true)
     {
     print("changed the state of " + itemType + " to hidden \n");
     }
     if (b == false)
     {
     print("changed the state of " + itemType + " to unhidden \n");
     }
     */

    isHidden = b;
  }
}
