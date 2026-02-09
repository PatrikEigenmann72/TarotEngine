/* ----------------------------------------------------------------------------------------
 * MainFrame.java - Provides the root window and primary GUI container for the application.
 * It manages layout, event routing, and user interaction across core components and is
 * intended to be reused across projects.
 *
 * By encapsulating the UI logic in this class, the application retains a clear separation
 * of concerns between interface and backend logic. This promotes modularity and allows
 * the UI to remain decoupled from specific functionality, making it suitable for Swing
 * applications or future frameworks.
 * ----------------------------------------------------------------------------------------
 * Author:      Patrik Eigenmann
 * eMail:       p.eigenmann@gmx.net
 * GitHub:      https://www.github.com/PatrikEigenmann/TarotEngine
 * ----------------------------------------------------------------------------------------
 * Change Log:
 * Wed 2026-02-04 File created.                                              Version: 00.01
 * ---------------------------------------------------------------------------------------- */

package tarotengine.gui;

import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import javax.swing.AbstractAction;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.KeyStroke;
import samael.huginandmunin.*;
import samael.chronicle.Config;
import samael.necronomicon.ResourceLoader;

/**
 * MainFrame.java - Provides the root window and primary GUI container for the application.
 * It manages layout, event routing, and user interaction across core components and is
 * intended to be reused across projects.
 *
 * By encapsulating the UI logic in this class, the application retains a clear separation
 * of concerns between interface and backend logic. This promotes modularity and allows
 * the UI to remain decoupled from specific functionality, making it suitable for Swing
 * applications or future frameworks.
 */
public class MainFrame extends JFrame {

    public MainFrame() {
        String msg = "Initializing MainFrame.";
        Debug.writeLine(Debug.DebugLevel.Info, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Info, msg, "MainFrame");

        msg = "Getting the title from the configuration: " + Config.getString("App.Name") + " - " + Config.getString("App.Version");
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        setTitle(Config.getString("App.Name") + " - " + Config.getString("App.Version"));

        msg = "Setting the window size to " + Config.getInt("App.Width") + " x " + Config.getInt("App.Height");
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        setSize(Config.getInt("App.Width"), Config.getInt("App.Height"));

        msg = "Setting default close operation to EXIT_ON_CLOSE.";
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        msg = "Setting location to center: null.";
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        setLocationRelativeTo(null); // Center the window

        msg = "Getting the label text from the configuration: " + Config.getString("App.Label.Text");
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        //JLabel label = new JLabel(Config.getString("App.Label.Text"), JLabel.CENTER);
        //JLabel label = new JLabel(ResourceLoader.loadText("hello.txt"), JLabel.CENTER);
        JLabel label = new JLabel(ResourceLoader.loadHtml("hello.html"), JLabel.CENTER);

        msg = "Setting label font to " + Config.getString("App.Label.Font") + ", size 24.";
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        label.setFont(new Font(Config.getString("App.Label.Font"), Font.PLAIN, 24));
        add(label);

        msg = "Binding Ctrl+Q to exit action";
        Debug.writeLine(Debug.DebugLevel.Verbose, msg, "MainFrame");
        Log.writeLine(Log.LogLevel.Verbose, msg, "MainFrame");
        getRootPane().getInputMap().put(KeyStroke.getKeyStroke(KeyEvent.VK_Q, KeyEvent.CTRL_DOWN_MASK), "exitApp");
        getRootPane().getActionMap().put("exitApp", new AbstractAction() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String msg1 = "Ctrl+Q pressed. Exiting application.";
                Debug.writeLine(Debug.DebugLevel.Info, msg1, "MainFrame");
                Log.writeLine(Log.LogLevel.Info, msg1, "MainFrame");
                System.exit(0);
            }
        });
    }
}
