package by.gsu.seawar.command.impl;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import by.gsu.seawar.Dispatcher;
import by.gsu.seawar.command.AbstractCommand;
import by.gsu.seawar.db.DBAccessor;

public class RegistryCommand extends AbstractCommand {

    public RegistryCommand(Dispatcher dispatcher) {
        super(dispatcher);
    }

    @Override
    public void exec() {
        final HttpServletRequest request = dispatcher.getRequest();

        String login = request.getParameter("login");
        String password = request.getParameter("password");
        String name = request.getParameter("name");

        String view = "/index.jsp";
        request.setAttribute("message", "Thank you for registration. Sign in you account");
        if (login == null && password == null && name == null) {
            view = "registration.jsp";
            request.setAttribute("message", "Sorry, but your need fill form! ");
        } else {
            try {
                DBAccessor.registration(login, password, name);
            } catch (SQLException e) {
                view = "registration.jsp";
                request.setAttribute("message", "Sorry. " + e);
            }
        }
        dispatcher.setView(view);
    }
}
