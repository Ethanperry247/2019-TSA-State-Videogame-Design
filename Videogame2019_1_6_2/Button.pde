class Button //added in 6.0
{
  //Display
  private float xPos;
  private float yPos;
  private float leng;
  private float wid;
  private PImage img = null;
  private String text = null;

  //Logic
  private boolean isActive;
  private boolean playedSound;

  public Button(float x, float y, float l, float w) //Blank
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;
  }

  public Button(float x, float y, float l, float w, String i) //Text
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;

    text = i;
  }

  public Button(float x, float y, float l, float w, PImage i) //IMG
  {
    xPos = x;
    yPos = y;
    leng = l;
    wid = w;

    img = i;
  }

  void display()
  {
    if (img != null)
    {
      if(isHovered())
      {
      screenI.image(img, xPos-5, yPos-5, leng+10, wid+10);
      }
      else
      {
      screenI.image(img, xPos, yPos, leng, wid);
      }
    } else if (text != null)
    {
      screenI.fill(255);
      screenI.rect(xPos, yPos, leng, wid);
      screenI.fill(0);
      screenI.text(text, xPos, yPos);
    } else
    {

      if (isHovered())
      {
        screenI.rect(xPos-5, yPos-5, leng+10, wid+10);
      } else
      {
        screenI.rect(xPos, yPos, leng, wid);
      }
    }
  }

  void setActive(boolean b)
  {
    isActive = b;
  }

  boolean isHovered()
  {
    if (mouseX > xPos && mouseY > yPos && mouseX < xPos + leng && mouseY < yPos+wid)
    {
      if(!playedSound && img != null)
      {
      hoverBoi.rewind();
      hoverBoi.play();
      playedSound = true;
      }
      return true;
    }
    playedSound = false;
    return false;
  }

  boolean isClicked()
  {
    if (isActive && isHovered() && mouseButton == LEFT)
    {
      thunk.rewind();
      thunk.play();
      return true;
    }
    return false;
  }
}
