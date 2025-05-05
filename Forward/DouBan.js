// --- Douban Widget ---

var WidgetMetadata = {
  id: "forward.douban.refined", // Changed ID slightly to reflect refinement
  title: "豆瓣榜单",     // Refined title
  description: "聚合豆瓣电影/剧集榜单、豆列", // Refined description
  author: "阿米诺斯 ", // Acknowledged optimization
  site: "",
  version: "1.2.0", // Updated version for refinement
  requiredVersion: "0.0.1",
  modules: [
    // --- Douban Modules ---
    {
      title: "电影实时热榜", // Removed Emoji & Prefix
      description: "当前热门电影榜单", // Refined
      requiresWebView: false,
      functionName: "loadDoubanItemsFromApi",
      params: [
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" }, // Removed Emoji
        { name: "limit", title: "每页数量", type: "constant", value: "20" }, // Removed Emoji
        { name: "url", title: "列表地址", type: "constant", value: "https://m.douban.com/rexxar/api/v2/subject_collection/movie_real_time_hotest/items" }, // Removed Emoji
        { name: "type", title: "类型", type: "constant", value: "movie" }, // Removed Emoji
      ],
    },
    {
      title: "剧集实时热榜", // Removed Emoji & Prefix
      description: "当前热门剧集榜单", // Refined
      requiresWebView: false,
      functionName: "loadDoubanItemsFromApi",
      params: [
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" }, // Removed Emoji
        { name: "limit", title: "每页数量", type: "constant", value: "20" }, // Removed Emoji
        { name: "url", title: "列表地址", type: "constant", value: "https://m.douban.com/rexxar/api/v2/subject_collection/tv_real_time_hotest/items" }, // Removed Emoji
        { name: "type", title: "类型", type: "constant", value: "tv" }, // Removed Emoji
      ],
    },
    {
      title: "Top 250 电影", // Removed Emoji & Prefix
      description: "评分最高的 250 部电影", // Refined
      requiresWebView: false,
      functionName: "loadDoubanCardItems",
      params: [
        { name: "url", title: "列表地址", type: "constant", value: "https://m.douban.com/subject_collection/movie_top250" }, // Removed Emoji
        { name: "page", title: "页码", type: "page", description:"加载第几页" }, // Removed Emoji
        { name: "limit", title: "每页数量", type: "constant", value: "20" }, // Removed Emoji
      ],
    },
     {
      title: "一周国内综艺榜", // Removed Emoji & Prefix
      description: "国内综艺口碑周榜", // Refined
      requiresWebView: false,
      functionName: "loadDoubanCardItems",
      params: [
        { name: "url", title: "列表地址", type: "constant", value: "https://m.douban.com/subject_collection/show_chinese_best_weekly" }, // Removed Emoji
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" } // Removed Emoji
      ]
    },
    {
      title: "一周全球综艺榜", // Removed Emoji & Prefix
      description: "全球综艺口碑周榜", // Refined
      requiresWebView: false,
      functionName: "loadDoubanCardItems",
      params: [
        { name: "url", title: "列表地址", type: "constant", value: "https://m.douban.com/subject_collection/show_global_best_weekly" }, // Removed Emoji
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" } // Removed Emoji
      ]
    },
     {
      title: "影视片单", // Removed Emoji & Prefix
      description: "加载官方榜单或用户豆列 (输入URL)", // Refined
      requiresWebView: false,
      functionName: "loadDoubanCardItems",
      params: [
        {
          name: "url", title: "列表地址", type: "input", description: "输入豆瓣榜单(subject_collection)或豆列(doulist)地址", // Removed Emoji
          placeholders: [
            { title: "一周电影口碑榜", value: "https://m.douban.com/subject_collection/movie_weekly_best" },
            { title: "一周华语口碑剧集榜", value: "https://m.douban.com/subject_collection/tv_chinese_best_weekly" },
            { title: "一周全球口碑剧集榜", value: "https://m.douban.com/subject_collection/tv_global_best_weekly" },
            // Keep Oscar example if relevant
            { title: "第97届奥斯卡 (2025)", value: "https://m.douban.com/subject_collection/EC7I7ZDRA?type=rank" },
            { title: "豆瓣电影测试豆列", value: "https://www.douban.com/doulist/155718871/" }
          ]
        },
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" }, // Removed Emoji
        { name: "limit", title: "每页数量", type: "constant", value: "20" }, // Removed Emoji & Consistent naming
      ],
    },
     {
      title: "电影榜单", // Removed Emoji & Prefix, Refined Title
      description: "按分类、地区、标签等筛选浏览电影", // Refined
      requiresWebView: false,
      functionName: "loadDoubanRecommendMovies",
      params: [
        {
          name: "category", title: "分类", type: "enumeration", // Removed Emoji
          enumOptions: [ { title: "全部", value: "全部" }, { title: "热门电影", value: "热门" }, { title: "最新电影", value: "最新" }, { title: "豆瓣高分", value: "豆瓣高分" }, { title: "冷门佳片", value: "冷门佳片" } ], // Removed duplicate '全部'
          value: "全部"
        },
        {
          name: "type", title: "地区", type: "enumeration", // Removed Emoji
          description: "按地区筛选 (主要对 热门/最新/高分/冷门 分类有效)",
          belongTo: { paramName: "category", value: ["热门", "最新", "豆瓣高分", "冷门佳片"] },
          enumOptions: [ { title: "全部", value: "全部" }, { title: "华语", value: "华语" }, { title: "欧美", value: "欧美" }, { title: "韩国", value: "韩国" }, { title: "日本", value: "日本" } ],
          value: "全部"
        },
        {
            name: "tags", title: "类型标签 (可选)", type: "input", // Removed Emoji
            description: "输入类型标签(如 喜剧, 爱情...), 仅当分类为'全部'时生效",
            value: "",
            belongTo: { paramName: "category", value: ["全部"] },
            placeholders: [
                {title: "喜剧", value: "喜剧"}, {title: "科幻", value: "科幻"}, {title: "爱情", value: "爱情"},
                {title: "动作", value: "动作"}, {title: "悬疑", value: "悬疑"}, {title: "动画", value: "动画"},
                {title: "纪录片", value: "纪录片"}, {title: "惊悚", value: "惊悚"}, {title: "剧情", value: "剧情"},
                {title: "家庭", value: "家庭"}, {title: "战争", value: "战争"}, {title: "奇幻", value: "奇幻"},
                {title: "历史", value: "历史"}, {title: "恐怖", value: "恐怖"}, {title: "犯罪", value: "犯罪"},
                {title: "歌舞", value: "歌舞"}, {title: "传记", value: "传记"}, {title: "冒险", value: "冒险"},
                {title: "武侠", value: "武侠"}, {title: "运动", value: "运动"}, {title: "古装", value: "古装"},
                {title: "同性", value: "同性"}
            ]
        },
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" }, // Removed Emoji
        { name: "limit", title: "每页数量", type: "constant", value: "20" } // Removed Emoji
      ],
    },
    {
      title: "电视榜单", // Removed Emoji & Prefix, Refined Title
      description: "按分类和类型筛选浏览剧集或综艺", // Refined
      requiresWebView: false,
      functionName: "loadDoubanRecommendShows",
      params: [
         {
          name: "category", title: "分类", type: "enumeration", // Removed Emoji
          enumOptions: [ { title: "全部", value: "all" }, { title: "热门剧集", value: "tv" }, { title: "热门综艺", value: "show" } ],
          value: "all"
        },
        {
          name: "type", title: "类型 (剧集)", type: "enumeration", // Removed Emoji
          description: "按类型筛选 (主要对 热门剧集 分类有效)",
          belongTo: { paramName: "category", value: ["tv"] },
          enumOptions: [ { title: "综合", value: "tv" }, { title: "国产剧", value: "tv_domestic" }, { title: "欧美剧", value: "tv_american" }, { title: "日剧", value: "tv_japanese" }, { title: "韩剧", value: "tv_korean" }, { title: "动画", value: "tv_animation" }, { title: "纪录片", value: "tv_documentary" } ],
          value: "tv"
        },
        {
          name: "type", title: "类型 (综艺)", type: "enumeration", // Removed Emoji
          description: "按类型筛选 (主要对 热门综艺 分类有效)",
          belongTo: { paramName: "category", value: ["show"] },
          enumOptions: [ { title: "综合", value: "show" }, { title: "国内", value: "show_domestic" }, { title: "国外", value: "show_foreign" } ],
          value: "show"
        },
        { name: "page", title: "页码", type: "page", description:"加载第几页数据" }, // Removed Emoji
        { name: "limit", title: "每页数量", type: "constant", value: "20" } // Removed Emoji
      ],
    },
    // --- Removed commented-out Oscar module ---
  ], // End of modules array
};

// --- Helper Functions ---

function createErrorItem(sourceId, title, error) {
    const errorMessage = String(error?.message || error || '未知错误');
    console.error(`Error in ${sourceId}:`, title, errorMessage, error);
    const uniqueId = `error-${sourceId.replace(/[^a-zA-Z0-9]/g, '-')}-${Date.now()}`;
    return {
        id: uniqueId,
        type: 'error',
        title: title || '加载失败',
        description: errorMessage
    };
}

function formatItemDescription(item) {
    let description = item.description || '';
    if (item.rating) {
        if (!description.toLowerCase().includes('rating') && !description.toLowerCase().includes('评分')) {
             description = `评分: ${item.rating} | ${description}`;
        }
    }
     if (item.releaseDate) {
        // Check if releaseDate is a non-empty string before substring
        if (typeof item.releaseDate === 'string' && item.releaseDate.length >= 4) {
            const year = item.releaseDate.substring(0, 4);
            if (!description.toLowerCase().includes('year') && !description.toLowerCase().includes('年份') && !description.includes(year)) {
                description = `年份: ${year} | ${description}`;
            }
        }
     }
    return description.trim().replace(/^\|\s*/, '').replace(/\s*\|$/, '');
}


// --- Douban Functions ---

// Main entry point, dispatches based on URL type
async function loadDoubanCardItems(params = {}) {
    try {
      console.log("开始解析豆瓣片单/豆列...");
      const url = params.url;
      if (!url || typeof url !== 'string' || url.trim() === '') {
          // Use createErrorItem for consistency, or a specific info item
          // return [createErrorItem('loadDoubanCardItems', '输入无效', { message: '请提供有效的豆瓣榜单或豆列网址。' })];
           return [{ id: `info-empty-url-${Date.now()}`, type: "info", title: "请输入网址", description: "请在上方输入框粘贴豆瓣榜单或豆列的网址。" }];
      }

      const trimmedUrl = url.trim();

      // 1. Doulist (www.douban.com) - Requires scraping
      if (trimmedUrl.includes("www.douban.com/doulist/")) {
        console.log("检测到 www 豆列 URL, 使用网页解析器:", trimmedUrl);
        return loadDoubanDefaultList(params);
      }
      // 2. Subject Collection (m.douban.com) - Uses API
      else if (trimmedUrl.includes("m.douban.com/subject_collection/")) {
        console.log("检测到 m 榜单 URL, 使用 subject_collection API:", trimmedUrl);
        return loadDoubanSubjectCollection(params);
      }
      // 3. Dispatch URL (doubanapp/dispatch)
      else if (trimmedUrl.includes("/doubanapp/dispatch") && trimmedUrl.includes("uri=")) {
        console.log("检测到 dispatch URL, 尝试提取目标链接:", trimmedUrl);
        const uriMatch = trimmedUrl.match(/uri=([^&]+)/);
        if (uriMatch && uriMatch[1]) {
          let decodedUri = "";
          try {
              decodedUri = decodeURIComponent(uriMatch[1]);
              console.log("解码后的 dispatch URI:", decodedUri);
          } catch (e) {
              console.error("解码 URI 参数失败:", e);
              return [createErrorItem('loadDoubanCardItems-dispatch', '解码失败', { message: '无法解码 dispatch URL 中的 URI 参数。' })];
          }

          // Determine target type and reconstruct URL
          let effectiveUrl = "";
          if (decodedUri.startsWith('/subject_collection/')) {
              effectiveUrl = `https://m.douban.com${decodedUri}`;
              console.log("Dispatch 指向 subject_collection, 调用 API:", effectiveUrl);
              return loadDoubanSubjectCollection({ ...params, url: effectiveUrl });
          } else if (decodedUri.startsWith('/doulist/')) {
              effectiveUrl = `https://www.douban.com${decodedUri}`;
               console.log("Dispatch 指向 doulist, 调用网页解析器:", effectiveUrl);
              return loadDoubanDefaultList({ ...params, url: effectiveUrl });
          } else {
             console.error("Dispatch URI 参数未包含可识别的路径:", decodedUri);
             return [createErrorItem('loadDoubanCardItems-dispatch', '无法识别的链接', { message: 'Dispatch URL 中的链接类型无法识别或暂不支持。' })];
          }
        } else {
          console.error("无法从 dispatch URL 中提取 URI 参数:", trimmedUrl);
          return [createErrorItem('loadDoubanCardItems-dispatch', '无法提取链接', { message: '无法从 dispatch URL 中提取有效的目标网址。' })];
        }
      }
      // 4. www subject_collection (Try converting to mobile API)
      else if (trimmedUrl.includes("www.douban.com/subject_collection/")) {
         console.log("检测到 www 榜单 URL, 尝试转换为 m URL 并调用 API:", trimmedUrl);
         const mobileUrl = trimmedUrl.replace("www.douban.com", "m.douban.com");
         return loadDoubanSubjectCollection({ ...params, url: mobileUrl });
      }
      // 5. Single subject link (Provide info)
      else if (trimmedUrl.match(/movie\.douban\.com\/subject\/\d+\/?$/) || trimmedUrl.match(/m\.douban\.com\/(movie|tv)\/subject\/\d+\/?$/)) {
          console.log("检测到单个条目链接:", trimmedUrl);
          return [{ id: `info-single-subject-${Date.now()}`, type: "info", title: "单个条目链接", description: "这是一个指向单个电影/剧集的链接，而非榜单或豆列。请粘贴榜单或豆列的网址。" }];
      }
      // --- Removed Oscar Desktop URL specific handling ---

      // 7. Unrecognized format (Final fallback)
      else {
          console.error("无法识别的豆瓣 URL 格式:", trimmedUrl);
          return [createErrorItem('loadDoubanCardItems', '不支持的 URL 格式', { message: '请检查输入的网址是否为有效的豆瓣官方榜单、用户豆列或分享链接。' })];
      }
    } catch (error) {
      console.error("解析豆瓣片单/豆列时发生内部错误:", error);
      return [createErrorItem('loadDoubanCardItems', '解析豆瓣片单/豆列失败', error)];
    }
}

// Scrapes www.douban.com/doulist/
async function loadDoubanDefaultList(params = {}) {
  const funcName = "loadDoubanDefaultList";
  const url = params.url;
  const listId = url.match(/doulist\/(\d+)/)?.[1];
  if (!listId) throw new Error("无法从 URL 获取豆瓣豆列 ID");

  const limit = params.limit || 25; // Doulist web page shows 25 per page
  const page = params.page || 1;
  const start = (page - 1) * limit;
  const pageUrl = `https://www.douban.com/doulist/${listId}/?start=${start}&sort=&playable=&sub_type=`;

  console.log(`[${funcName}] 请求豆瓣豆列页面: ${pageUrl}`);
  const response = await Widget.http.get(pageUrl, {
    headers: {
      Referer: `https://www.douban.com/`,
      "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/108.0.0.0 Safari/537.36",
      "Accept-Language": "zh-CN,zh;q=0.9" // Request Chinese page for consistency
    },
  });

  if (!response || !response.data) throw new Error("获取豆瓣豆列数据失败");
  const docId = Widget.dom.parse(response.data);
  if (docId < 0) throw new Error("解析豆瓣豆列 HTML 失败");

  // Selectors based on potential Douban Doulist structures
  const primarySelector = "div.doulist-item";
  const fallbackSelector1 = ".article .doulist-subject";
  const fallbackSelector2 = ".article li.subject-item";
  let itemElements = Widget.dom.select(docId, primarySelector);
  let usedSelector = primarySelector;

  if (!itemElements || itemElements.length === 0) {
       itemElements = Widget.dom.select(docId, fallbackSelector1);
       usedSelector = fallbackSelector1;
       if (!itemElements || itemElements.length === 0) {
           itemElements = Widget.dom.select(docId, fallbackSelector2);
           usedSelector = fallbackSelector2;
       }
  }

  if (!itemElements || itemElements.length === 0) {
      const pagingNext = Widget.dom.selectFirst(docId, ".paginator .next a");
      if (pagingNext < 0) {
          console.log(`[${funcName}] 已到达豆列末尾或豆列为空 (Selector: ${usedSelector})`);
          return [];
      } else {
           console.warn(`[${funcName}] 页面结构可能已更改，使用选择器 '${usedSelector}' 未找到项目，但存在分页`);
           return [];
      }
  }
  console.log(`[${funcName}] 使用选择器 '${usedSelector}' 找到 ${itemElements.length} 个元素`);

  let doubanItems = [];
  for (const itemId of itemElements) {
       // Try various selectors for link/title
       let titleElementId = Widget.dom.selectFirst(itemId, ".title a");
       if (titleElementId < 0) titleElementId = Widget.dom.selectFirst(itemId, ".item-title a");
       if (titleElementId < 0) titleElementId = Widget.dom.selectFirst(itemId, "a[onclick*='subject']"); // Common pattern

      if (titleElementId >= 0) {
          const link = await Widget.dom.attr(titleElementId, "href");
          const idMatch = link ? link.match(/subject\/(\d+)/) : null;
          const title = await Widget.dom.text(titleElementId);

          if (idMatch && idMatch[1]) {
              // Cover selectors
              let coverUrl = "";
              let imgElementId = Widget.dom.selectFirst(itemId, ".post img");
              if (imgElementId < 0) imgElementId = Widget.dom.selectFirst(itemId, ".item-poster img");
              if (imgElementId >= 0) {
                  coverUrl = await Widget.dom.attr(imgElementId, "src");
                  if (coverUrl) {
                      coverUrl = coverUrl.replace(/\/(s|m|sq)\//, '/l/').replace('http:', 'https:'); // Improve URL
                  }
              }

              // Description selectors
              let description = "";
              let abstractElementId = Widget.dom.selectFirst(itemId, ".abstract");
              if (abstractElementId < 0) abstractElementId = Widget.dom.selectFirst(itemId, ".card-abstract");
              if (abstractElementId >= 0) {
                  description = await Widget.dom.text(abstractElementId);
                  description = description.trim().replace(/\n\s*/g, ' ');
              }

              // Rating selectors
              let rating = undefined;
              let ratingElementId = Widget.dom.selectFirst(itemId, ".rating .rating_nums");
              if (ratingElementId < 0) ratingElementId = Widget.dom.selectFirst(itemId, ".item-rating .rating_nums");
              if (ratingElementId >= 0) {
                  rating = await Widget.dom.text(ratingElementId);
                  rating = rating ? parseFloat(rating.trim()) : undefined;
              }

               // Extract year from description
              let releaseDate = undefined;
              const yearMatch = description.match(/\b(\d{4})\b/);
              if (yearMatch && yearMatch[1]) {
                  releaseDate = `${yearMatch[1]}-01-01`;
              }

              doubanItems.push({
                  id: idMatch[1],
                  type: "douban",
                  title: title ? title.trim() : "未知标题",
                  posterPath: coverUrl || undefined,
                  description: formatItemDescription({ description: description || undefined, rating: rating }),
                  rating: rating,
                  releaseDate: releaseDate,
                  // mediaType unknown from doulist
              });
          } else {
             console.warn(`[${funcName}] 解析豆列项时未找到 subject ID, Title: ${title}, Link: ${link}`);
          }
      } else {
         console.warn(`[${funcName}] 在豆列项中未找到标题链接元素, Item ID: ${itemId}`);
      }
  }
  console.log(`[${funcName}] 解析到 ${doubanItems.length} 个豆瓣条目`);
  return doubanItems;
}

// Fetches data from Douban's mobile API endpoints (subject_collection based)
async function loadDoubanItemsFromApi(params = {}) {
  const funcName = "loadDoubanItemsFromApi";
  const url = params.url; // Base API URL like .../movie_real_time_hotest/items
  const limit = params.limit || 20;
  const page = params.page || 1;
  const start = params.start !== undefined ? params.start : (page - 1) * limit;
  const mediaTypeParam = params.type || undefined; // 'movie' or 'tv' if passed

  const apiUrl = `${url}?start=${start}&count=${limit}&updated_at&items_only=1&for_mobile=1`;
  console.log(`[${funcName}] 请求豆瓣 API: ${apiUrl}`);

  const listIdMatch = params.url.match(/subject_collection\/(\w+)/);
  const referer = listIdMatch ? `https://m.douban.com/subject_collection/${listIdMatch[1]}/` : 'https://m.douban.com/';

  try {
    const response = await Widget.http.get(apiUrl, {
      headers: {
        Referer: referer,
        "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1",
      },
    });

    // console.log("豆瓣 API 响应:", response.data); // Optional: Log full response if needed
    if (response.data && response.data.subject_collection_items) {
      const items = response.data.subject_collection_items;
      if (!Array.isArray(items)) {
          throw new Error("API 返回的 subject_collection_items 不是数组");
      }
      console.log(`[${funcName}] API 返回了 ${items.length} 个项目`);

      const doubanItems = items.map((item) => {
         if (!item || !item.id) {
             console.warn(`[${funcName}] 跳过无效项目 (缺少 id):`, item);
             return null; // Mark as invalid
         }
         const releaseDate = item.year ? `${item.year}-01-01` : undefined;
         const ratingValue = item.rating?.value ? parseFloat(item.rating.value) : undefined;

         return {
            id: String(item.id), // Ensure ID is string
            type: "douban",
            title: item.title || "未知标题",
            posterPath: item.cover?.url?.replace('http:', 'https:') || undefined,
            description: formatItemDescription({
                description: item.card_subtitle || item.description,
                rating: ratingValue,
                releaseDate: releaseDate
            }),
            rating: ratingValue,
            releaseDate: releaseDate,
            // Use passed mediaType first, fallback to API item type (movie/tv)
            mediaType: mediaTypeParam || item.type || undefined
          };
      }).filter(item => item !== null); // Filter out invalid items

      console.log(`[${funcName}] 成功解析并过滤得到 ${doubanItems.length} 个有效条目`);
      return doubanItems;

    } else {
        console.warn(`[${funcName}] API 响应中未找到 subject_collection_items`, response.data);
        return []; // Return empty array if no items found
    }
  } catch(error) {
      console.error(`[${funcName}] 请求或处理 API (${apiUrl}) 时出错:`, error);
      // Return error item for graceful failure
      return [createErrorItem(funcName, '调用豆瓣 API 失败', error)];
  }
}

// Helper to call loadDoubanItemsFromApi for subject collections
async function loadDoubanSubjectCollection(params = {}) {
  const funcName = "loadDoubanSubjectCollection";
  const listIdMatch = params.url.match(/subject_collection\/(\w+)/);
  if (!listIdMatch) throw new Error("无法从 URL 获取豆瓣合集 ID");

  const listId = listIdMatch[1];
  // Construct the specific API URL
  const apiUrl = `https://m.douban.com/rexxar/api/v2/subject_collection/${listId}/items`;
  console.log(`[${funcName}] 准备调用 API for collection ID: ${listId}`);

  // Pass the constructed URL and other params to the generic API loader
  return await loadDoubanItemsFromApi({
      ...params, // Pass existing params like page, limit
      url: apiUrl, // Override url with the specific API endpoint
      // Let loadDoubanItemsFromApi determine mediaType from items if not passed
  });
}

// --- Recommend Functions ---

async function loadDoubanRecommendMovies(params = {}) {
  return await loadDoubanRecommendItems(params, "movie");
}

async function loadDoubanRecommendShows(params = {}) {
  return await loadDoubanRecommendItems(params, "tv");
}

// Core function for fetching recommendations or categorized lists
async function loadDoubanRecommendItems(params = {}, mediaType = "movie") {
  const funcName = "loadDoubanRecommendItems";
  const limit = params.limit || 20;
  const page = params.page || 1;
  const start = (page - 1) * limit;
  const category = params.category || ""; // e.g., "热门", "最新", "全部", "tv", "show"
  const subType = params.type || ""; // e.g., "华语", "欧美", "tv_domestic", "show_foreign"
  const tags = params.tags || "";
  const encodedTags = encodeURIComponent(tags);

  let apiUrl = "";
  let apiType = ""; // For logging

  // --- Route based on parameters ---
  // Optimization for TV subcategories (like 国产剧, 欧美剧)
  if (mediaType === 'tv' && category === 'tv' && subType && subType !== 'tv') {
      apiUrl = `https://m.douban.com/rexxar/api/v2/subject_collection/${subType}/items`;
      apiType = "subject_collection (TV Subcategory)";
      console.log(`[${funcName}] 使用 ${apiType} API: ${apiUrl}`);
      // Use loadDoubanItemsFromApi for this specific structure
      return await loadDoubanItemsFromApi({
          ...params, // Pass page, limit
          url: apiUrl,
          type: 'tv' // Explicitly set mediaType
      });
  }
  // '全部' category or when tags are present (use recommend API)
  else if (category === "全部" || category === "all" || (tags && (category === "全部" || category === "all"))) {
      apiUrl = `https://m.douban.com/rexxar/api/v2/${mediaType}/recommend?refresh=0&start=${start}&count=${limit}`;
      if (encodedTags) {
          apiUrl += `&tags=${encodedTags}`;
      }
      apiType = "recommend";
  }
  // Other categories (热门, 最新, show, etc. - use recent_hot API)
  else {
      apiUrl = `https://m.douban.com/rexxar/api/v2/subject/recent_hot/${mediaType}?start=${start}&count=${limit}&category=${encodeURIComponent(category)}&type=${encodeURIComponent(subType)}`;
      apiType = "recent_hot";
  }

  console.log(`[${funcName}] 使用 ${apiType} API: ${apiUrl}`);

  try {
      const response = await Widget.http.get(apiUrl, {
        headers: {
          Referer: `https://movie.douban.com/explore`, // Generic referer
          "User-Agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 13_2_3 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.0.3 Mobile/15E148 Safari/604.1",
        },
      });

      // console.log(`[${funcName}] API Response:`, response.data); // Optional: Log full response
      // Robustly find the items array
      const items = response.data?.subjects
                 || response.data?.items
                 || response.data?.modules?.[0]?.data?.subject_collection_items // Handle nested structure
                 || [];

      if (!Array.isArray(items)) {
          throw new Error(`API (${apiType}) 返回的项目不是数组`);
      }
      console.log(`[${funcName}] API (${apiType}) 返回了 ${items.length} 个项目`);

      if (items.length > 0) {
          const results = items.map((item) => {
            if (!item || !item.id || !item.title) {
                console.warn(`[${funcName}] 跳过无效项目 (缺少 id 或 title):`, item);
                return null;
            }
            const ratingValue = item.rating?.value || (item.rate ? parseFloat(item.rate) : undefined);
            const releaseYear = item.year || item.release_date?.substring(0, 4);
            const cover = item.cover?.url || item.pic?.normal;
            const releaseDate = releaseYear ? `${releaseYear}-01-01` : undefined;

            return {
                id: String(item.id),
                type: "douban",
                title: item.title,
                posterPath: cover ? cover.replace('http:', 'https:') : undefined,
                description: formatItemDescription({
                    description: item.card_subtitle || item.description || item.intro,
                    rating: ratingValue,
                    releaseDate: releaseDate
                }),
                rating: ratingValue,
                releaseDate: releaseDate,
                mediaType: mediaType // Set based on the function parameter
            };
          }).filter(item => item !== null);

         console.log(`[${funcName}] 成功解析并过滤得到 ${results.length} 个有效条目`);
         if (results.length === 0 && items.length > 0) {
             console.warn(`[${funcName}] API 返回了项目但未能成功映射或过滤任何有效条目，检查 API 结构或映射逻辑。`);
         }
         return results;

      } else {
          console.log(`[${funcName}] API (${apiType}) 响应中未找到有效项目列表或列表为空`);
          return []; // Return empty array if no items found or end of list
      }
  } catch (error) {
      console.error(`[${funcName}] 请求或处理 API (${apiUrl}) 时出错:`, error);
      return [createErrorItem(`${funcName}-${mediaType}-${category}`, `加载豆瓣 ${mediaType} 推荐失败`, error)];
  }
}
