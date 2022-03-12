'''A module for testing'''
import unittest
from app import APP


class CyclonesTests(unittest.TestCase):
    '''Tests for the Cyclones'''
    def setUp(self):
        '''Create a test client for the app'''
        self.app = APP.test_client()

    def test_guid(self):
        '''test_guid: a request for the guid shall return 200 OK'''
        res = self.app.get('/05024756-765e-41a9-89d7-1407436d9a58')
        assert res.status == '200 OK'

    def test_json(self):
        '''test_json: a request for the guid shall return the defined JSON'''
        res = self.app.get('/05024756-765e-41a9-89d7-1407436d9a58')
        assert res.json == {"guid":"05024756-765e-41a9-89d7-1407436d9a58","latlong":"42.026111,-93.648333","location":"Ames, IA, USA","mascot":"Cy","nickname":"Cyclones", "school":"Iowa State University"}


if __name__ == "__main__":
    unittest.main()
