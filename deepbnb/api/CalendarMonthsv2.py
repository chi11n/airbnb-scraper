import json
import requests

from logging import LoggerAdapter



from deepbnb.api.ApiBase import ApiBase


class CalendarMonths(ApiBase):
    """Airbnb API v2 calendar months endpoint"""

    def __init__(
            self,
            api_key: str,
            logger: LoggerAdapter,
            currency: str,
    ):
        super().__init__(api_key, logger, currency)

    def api_request(self, listing_id: str):
        self._logger.info("starting CalendarMonthsV2 request")
        """Perform API request."""
        # get first batch of reviews
        return self._get_availability_percent(listing_id)

    def _get_availability_percent(self, listing_id: str):
        """Get reviews for a given listing ID in batches."""
        self._logger.info("starting get availability")
        url = self._get_url(listing_id)
        headers = self._get_search_headers()
        response = requests.get(url, headers=headers)
        data = json.loads(response.text)
        #self._logger.debug(data)
        self._logger.info("parsing_listing_contents for Calendar " + data["calendar_months"][0]['abbr_name'])

        # loop through the calendar  data["calendar_months"]
        # and count totals and available =true
        total = 0
        countAvailable = 0
        for calData in data["calendar_months"]:
            for day in calData['days']:
                total += 1
                self._logger.debug(day['date'] + " available=" + str(day['available']))
                if day['available']:
                    countAvailable += 1


        self._logger.debug("countAvailable=" + str(countAvailable) + ", total=" + str(total) + ", percent=" + str(((countAvailable / total), 2)))

        return str(countAvailable / total)

    def _get_url(self, listing_id: str) -> str:
        """Generate scrapy.Request for listing page."""
        _api_path = '/api/v2/calendar_months'
        query = {
            'locale': 'en',
            'currency': self._currency,
            'key': self.api_key,
            'listing_id': listing_id,
            'month': 7,
            'year': 2021,
            'count': 12,
            '_format': 'with_conditions',
            'variables': {
                'request': {

                }
            },
            'extensions': {
                'persistedQuery': {
                    'version': 1,
                    'sha256Hash': '4730a25512c4955aa741389d8df80ff1e57e516c469d2b91952636baf6eee3bd'
                }
            }
        }

        self._put_json_param_strings(query)

        return self._build_airbnb_url(_api_path, query)
