<%@ page import="java.io.*, javax.xml.parsers.*, org.w3c.dom.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to theMoscafe</title>
    <style>
        body {
            background-color: #f8e0b0;
            font-family: Arial, sans-serif;
            text-align: center;
        }
        h1 {
            color: #8b4513;
        }
        .menu {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px gray;
            display: inline-block;
            margin-top: 20px;
        }
        .menu-item {
            padding: 10px;
            font-size: 18px;
            color: #5a3e1b;
        }
    </style>
</head>
<body>
    <h1>Welcome to Mohan's Coffee Shop ☕</h1>
    <h2>Our Menu</h2>
    
    <div class="menu">
        <%
            try {
                File xmlFile = new File(application.getRealPath("/WEB-INF/menu.xml"));
                DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
                DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
                Document doc = dBuilder.parse(xmlFile);
                doc.getDocumentElement().normalize();

                NodeList nList = doc.getElementsByTagName("item");

                for (int temp = 0; temp < nList.getLength(); temp++) {
                    Node nNode = nList.item(temp);
                    if (nNode.getNodeType() == Node.ELEMENT_NODE) {
                        Element eElement = (Element) nNode;
                        String name = eElement.getElementsByTagName("name").item(0).getTextContent();
                        String price = eElement.getElementsByTagName("price").item(0).getTextContent();
        %>
                        <div class="menu-item">
                            <strong><%= name %></strong> - ₹<%= price %>
                        </div>
        <%
                    }
                }
            } catch (Exception e) {
                out.println("<p>Error loading menu.</p>");
            }
        %>
    </div>

    <h3>Enjoy your Coffee! ☕</h3>
</body>
</html>
