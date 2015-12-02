package com.company;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class Main {

    public static void main(String[] args) {

        String smth;
        System.out.println("We're trying to POST some token into the codeabby servers:");
        smth=excutePost("http://codeabbey.sourceforge.net/say-100.php","token=TijKyF6Y7U1RW2ZwJbjJ0zg0");
        System.out.println(smth);
        int result=100-Integer.parseInt(smth.split(" ")[1].trim());
        System.out.println("So, for now, we get the answer! Now we need to send the answer:");
        System.out.println("answer = "+result+"\nLet's do it!");
        String urlParameters =
                "token=" + URLEncoder.encode("TijKyF6Y7U1RW2ZwJbjJ0zg0") +
                        "&answer=" + URLEncoder.encode(String.valueOf(result));
        smth=excutePost("http://codeabbey.sourceforge.net/say-100.php",urlParameters);
        System.out.println("now we get a response, and it's an our victory token:");
        System.out.println(smth);

    }

    public static String excutePost(String targetURL, String urlParameters)
    {
        URL url;
        HttpURLConnection connection = null;
        try {
            //Create connection
            url = new URL(targetURL);
            connection = (HttpURLConnection)url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded");

            connection.setRequestProperty("Content-Length", "" +
                    Integer.toString(urlParameters.getBytes().length));
            connection.setRequestProperty("Content-Language", "en-US");

            connection.setUseCaches (false);
            connection.setDoInput(true);
            connection.setDoOutput(true);

            //Send request
            DataOutputStream wr = new DataOutputStream (
                    connection.getOutputStream ());
            wr.writeBytes (urlParameters);
            wr.flush ();
            wr.close ();

            //Get Response
            InputStream is = connection.getInputStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(is));
            String line;
            StringBuffer response = new StringBuffer();
            while((line = rd.readLine()) != null) {
                response.append(line);
                response.append('\r');

            }
            rd.close();
            return response.toString();

        } catch (Exception e) {

            e.printStackTrace();
            return null;

        } finally {

            if(connection != null) {
                connection.disconnect();
            }
        }
    }
}
