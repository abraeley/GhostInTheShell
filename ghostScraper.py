# ghostScraper script
import scrapy


# Build web crawling spider
class spider(scrapy.Spider):
    name = "pages"

    urls = [
    'https://www.journals.elsevier.com/planetary-and-space-science/recent-articles',
    'https://pubs.geoscienceworld.org/geology/issue/current',
    'https://pubs.geoscienceworld.org/geophysics/issue/current',
    'https://www.journals.elsevier.com/icarus/recent-articles'
    ]

    def parser(self, response):
        page = response.url.split("/")[-2]
        filename = f'article-{page}.html'
        with open(filename, 'wb') as f:
            f.write(response.body)
        self.log(f'Saved file {filename}')
