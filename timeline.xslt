<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" encoding="UTF-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
            <head>
                <meta charset="UTF-8"/>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <title>HCCC 50 Years Timeline</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
                <link href="./timeline.css" rel="stylesheet"/>
            </head>
            <body>
                <div class="container-fluid">
                    <h1 class="text-center my-4">HCCC: 50 Years of Excellence</h1>
                    
                    <div class="timeline-container">
                        <div class="timeline">
                            <xsl:for-each select="timeline/year">
                                <div class="timeline-row">
                                    <div class="timeline-segment">
                                        <div class="year-marker">
                                            <xsl:value-of select="@value"/>
                                        </div>
                                        <div class="events-group">
                                            <xsl:apply-templates select="event">
                                                <xsl:sort select="date"/>
                                            </xsl:apply-templates>
                                        </div>
                                    </div>
                                </div>
                            </xsl:for-each>
                        </div>
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
                <script>
                    function adjustConnectingLines() {
                        const yearGroups = document.querySelectorAll('.events-group');
                        
                        yearGroups.forEach(group => {
                            const timelineItems = group.querySelectorAll('.timeline-item');
                            
                            timelineItems.forEach((item, index) => {
                                // Skip the first item in each year group
                                if (index === 0) return;
                                
                                // Create connecting line container
                                const lineContainer = document.createElement('div');
                                lineContainer.className = 'connecting-line-container';
                                
                                // Create the actual line
                                const line = document.createElement('div');
                                line.className = 'connecting-line';
                                
                                // Insert the line before the timeline item
                                lineContainer.appendChild(line);
                                item.parentNode.insertBefore(lineContainer, item);
                            });
                        });
                    }

                    // Run once DOM is fully loaded
                    document.addEventListener('DOMContentLoaded', adjustConnectingLines);
                </script>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="event">
        <div class="timeline-item card border-0 shadow-sm h-100 aspect-ratio-1x1 rounded-0">
            <img>
                <xsl:attribute name="src">
                    <xsl:value-of select="image"/>
                </xsl:attribute>
                <xsl:attribute name="alt">
                    <xsl:value-of select="title"/>
                </xsl:attribute>
                <xsl:attribute name="class">card-img-top object-fit-cover rounded-0</xsl:attribute>
            </img>
            <div class="card-body d-flex flex-column p-3">
                <div class="text-primary fw-semibold small mb-1">
                    <xsl:value-of select="date"/>
                </div>
                <h4 class="card-title h6 mb-1"><xsl:value-of select="title"/></h4>
                <p class="card-text small text-secondary mb-0"><xsl:value-of select="description"/></p>
            </div>
        </div>
    </xsl:template>
</xsl:stylesheet> 