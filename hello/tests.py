from django.test import TestCase

# Create your tests here.
from django.urls import reverse



class HelloWorldTestCase(TestCase):
    def test_hello_world(self):
        url = reverse('home')  # Use the name of your view function, which is 'home'
        response = self.client.get(url)
        self.assertEqual(response.status_code, 200)
        self.assertContains(response, "Hello world!!! this is my capstone project......")