local M = {}

M.setup = function()
    print("Learning to build neovim plugins")
end

-- @class present.Slides
-- @fields slides string[]

-- @param text string[]: The lines in the buffer
-- @return present.Slides
local parse_text = function(text)
    local slides = { slides = {} }
    for _, line in ipairs(text) do
        print(line)
        table.insert(slides.slides, line)
    end
end

-- @param content string: The content to split
-- @param delimiter string: The delimiter based on which the string will be splitted.
-- @return string
local split_strings = function(content, delimiter)
    local result = {}
    local pattern = "([^" .. delimiter .. "]+)"
    for match in content:gmatch(pattern) do
        table.insert(result, match)
    end
    return result
end

local test_string = [==[
# Slide 1: Title

### Response to TeleComX

### AI‑Driven Customer Support Chatbot

*May 2025*

# Slide 2: Agenda

* Client & Market Overview
* Project Goals & ROI
* Scope of Work
* Technical Approach
* Data Privacy & Security
* Timeline & Next Steps

# Slide 3: Client & Market Overview

* **TeleComX**: Leading telecom in Bangladesh
* Serves **10+ million** customers nationwide
* Rising demand for **self‑service** & **24/7** support
* Opportunity to **reduce costs** and **boost CSAT**

# Slide 4: Project Goals & ROI

* **Automate 80%** of common customer queries
* Bilingual support: **English & Bengali**
* Seamless integration with **Salesforce CRM** & **Zendesk**
* **50% reduction** in average response time
* **Lower agent workload** and **higher satisfaction**

# Slide 5: Scope of Work

* Finalize use cases & conversation flows with stakeholders
* Develop NLU‑powered chatbot for **web (React)** & **mobile (Flutter)**
* Integrate with **Salesforce CRM** & **Zendesk** via RESTful APIs
* Build **admin dashboard** for monitoring & analytics
* Conduct testing, deploy to production & provide **6 months support**

# Slide 6: Technical Approach

* **Cloud‑native, microservices** architecture (99.9% uptime)
* **RESTful APIs** with OAuth2, JSON, HTTPS, rate‑limit handling
* **React widget** for web; **Flutter SDK** for mobile
* Context management & seamless escalation to live agents
* Multimedia support: **text, images, links**

# Slide 7: Data Privacy & Security

* Compliance with **GDPR** & **Bangladesh Data Protection Act**
* Data residency in Bangladesh; no cross‑border transfer without consent
* Encryption: **TLS 1.2+** in transit; **AES‑256** at rest
* **Role‑based access** control & full **audit logging**
* **24‑hour breach reporting** & mandatory staff training

# Slide 8: Timeline & Key Milestones

* **RFP Release:** May 10, 2025
* **Proposal Submission:** May 24, 2025
* **Vendor Selection:** June 1, 2025
* **Project Kickoff:** June 10, 2025
* **MVP Delivery:** August 2025
* **Production Launch:** October 2025

# Slide 9: Next Steps & Contacts

* Review proposal & finalize contract
* Schedule detailed scoping workshops
* Assign TeleComX & vendor project teams
* **Key Contacts:**

  * Imran Hossain (Project Owner)
  * Farhana Rahman (Executive Sponsor)
  * Sazzad Mahmud (Procurement Backup)
]==]
local test_lines = split_strings(test_string, "\n")

parse_text(test_lines)

return M
