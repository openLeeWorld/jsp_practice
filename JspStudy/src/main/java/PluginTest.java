import java.awt.*;
import java.applet.Applet;

public class PluginTest extends Applet {
	String name;
	
	public void init() {
		name=getParameter("name");
	}

	public void pain(Graphics g) {
		g.drawString(name,10,10);
	}
}