package com.azeredudu.gestion.banque.entities;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendToEmail {
    String d_email = "azere_mabiala@yahoo.com",
                   d_password = "christophe242",
                   d_host = "smtp.mail.yahoo.com",
                   d_port = "465",// SSL PORT
            m_subject = "Deposit report";

    public SendToEmail( String subject, User user, double amount, String codeCompte, String currency, String baseUrl,
            String operation, String s ) {
        String text = "Hi " + user.getFirstName() + " " + user.getLastName() + ", \n \n";
        text += "A " + operation + " of " + amount + " " + currency + " has been made " + s + " this account : "
                + codeCompte
                + "\n";

        text += "For more information, check your transactions details " + baseUrl;
        Properties props = new Properties();
        props.put( "mail.smtp.user", d_email );
        props.put( "mail.smtp.host", d_host );
        props.put( "mail.smtp.port", d_port );
        props.put( "mail.smtp.starttls.enable", "true" );
        props.put( "mail.smtp.auth", "true" );
        props.put( "mail.smtp.debug", "true" );
        props.put( "mail.smtp.socketFactory.port", d_port );
        props.put( "mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory" );
        props.put( "mail.smtp.socketFactory.fallback", "false" );

        SecurityManager security = System.getSecurityManager();

        try
        {
            Authenticator auth = new SMTPAuthenticator();
            Session session = Session.getInstance( props, auth );
            // session.setDebug(true);

            MimeMessage msg = new MimeMessage( session );
            msg.setText( text );
            msg.setSubject( subject );
            msg.setFrom( new InternetAddress( d_email ) );
            msg.addRecipient( Message.RecipientType.TO, new InternetAddress( user.getEmail() ) ); // strEmailAddress
            Transport.send( msg );
        } catch ( Exception mex )
        {
            mex.printStackTrace();
        }
    }

    public class SMTPAuthenticator extends javax.mail.Authenticator
    {
        public PasswordAuthentication getPasswordAuthentication()
        {
            return new PasswordAuthentication( d_email, d_password );
        }
    }

}