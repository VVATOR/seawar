package by.gsu.seawar.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import by.gsu.seawar.beans.Point;
import by.gsu.seawar.beans.User;
import by.gsu.seawar.constants.FireStatus;
import by.gsu.seawar.db.DBAccessor;

/**
 * Servlet implementation class FireController
 */
@WebServlet("/FireController")
public class FireController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FireController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int pointParam = Integer.parseInt(request.getParameter("point"));
		int gameId = Integer.parseInt(request.getParameter("gameId"));
		int userId = Integer.parseInt(request.getParameter("userId"));
		System.out.println("FIRE -> game:" + gameId + " user:" + userId + " point:" + pointParam);

		int x = pointParam % 10;
		int y = pointParam / 10;
		Point point = new Point(x, y);

		FireStatus status = FireStatus.ERROR;
		PrintWriter out = null;
		try {
			out = response.getWriter();

			try {
				status = DBAccessor.fire(gameId, userId, point);
				System.out.println("===================================");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("eeeeeerrrroooorr");

			}
			
			
			
		 //	User userPlay = (User) request.getSession().getAttribute("current_user");
			
	 	//	List<Point> currentUserListPositions = DBAccessor.getListPositions(gameId, userPlay.getId());

			// DBAccessor.setWin(gameId, userPlay.getId());

			System.out.println("x:" + x + "; y:" + y + " -> " + status.toString());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		out.println(status.toString());

	/*	
		try {
			User userPlay = (User) request.getSession().getAttribute("current_user");
			User enemy = DBAccessor.getUserById(DBAccessor.getEnemyId(gameId, userId));
			
			List<Point> listUserPosition = DBAccessor.getListPositions(gameId, userId);

			try {
				List<Point> currentUserListPositions = DBAccessor.getListPositions(gameId, userPlay.getId());

				System.out.println("*********" + currentUserListPositions);

				request.setAttribute("currentUserListPositions", currentUserListPositions);
				// request.setAttribute("enemy",
				// DBAccessor.getEnemyUserByGame(g,userPlay.getId()));

			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println("ERROR CREATE_FIELD_BY_USER");
			}

			List<Point> listEnemyPosition = DBAccessor.getListPositions(gameId, enemy.getId());
			if (listEnemyPosition.isEmpty()) {
				request.setAttribute("enemy", enemy);

			} else {
				request.setAttribute("enemyUserListPositions", listEnemyPosition);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/WEB-INF/views/battle/battleField2.jsp").forward(request, response);
		;*/
	}

}
