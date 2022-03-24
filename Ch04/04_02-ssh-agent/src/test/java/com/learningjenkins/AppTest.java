package com.learningjenkins;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * Unit test for simple App.
 */
public class AppTest
{
    @Test
    public void CheckHelloWorld()
    {
        App app = new App();
        assertEquals( "Hello World!", app.main() );
    }
}
